import 'dart:async';
import 'dart:io';
import 'package:absher_app/core/functions/show_dialog.dart';
import 'package:absher_app/core/notifications/add_notification.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class StepsProvider with ChangeNotifier {
  int _currentStep = 0;
  int get currentStep => _currentStep;
  onStepContinue() {
    if (_currentStep < 2) {
      _currentStep += 1;
      notifyListeners();
    }
  }

  onStepCancel() {
    if (_currentStep > 0) {
      _currentStep -= 1;
      notifyListeners();
    }
  }

  onStepTap(int index) {
    _currentStep = index;
    notifyListeners();
  }

  // step 1
  int? index;
  selectRo2yaType(int index) {
    this.index = index;
    notifyListeners();
  }

  // step 2
  bool useMic = false;
  bool loadMic = false;
  loadMicSetting() {
    recorder = FlutterSoundRecorder();
    player = FlutterSoundPlayer();
    _initRecorder();
  }

  turnMic(bool value) {
    useMic = value;
    if (useMic && !loadMic) {
      loadMicSetting();
      loadMic = true;
    }
    notifyListeners();
  }

  List<String> genderList = ["ذكر", "انثى"];
  List<String> employmentStatusList = [
    "موظف/ه",
    "غير موظف/ه",
    "طالب/ة",
    "ربة منزل",
    "لا يعمل"
  ];
  List<String> maritalStatusList = [
    "اعزب/ه",
    "متزوج/ة",
    "مطلق/ة",
    "ارمل/ة",
  ];
  final TextEditingController ageController = TextEditingController();
  final TextEditingController moreDataController = TextEditingController();
  final TextEditingController ro2yaTimeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final employmentStatusController = TextEditingController();
  final genderController = TextEditingController();
  final maritalStatusController = TextEditingController();
  final TextEditingController ro2yaController = TextEditingController();
  final TextEditingController ro2yaNameController = TextEditingController();
  set employmentStatus(String employmentStatus) {
    employmentStatusController.text = employmentStatus;
    notifyListeners();
  }

  //step 3
  String ro2yaType = '';
  bool dataLoaded = false;
  selectAboutRo2ya(String ro2yaType) {
    this.ro2yaType = ro2yaType;
    notifyListeners();
  }

  final supabase = Supabase.instance.client;
  sendRo2ya(BuildContext context) async {
    if (filePath != null) {
      ro2yaController.text = "تم ارسال رؤيا صوتيه";
    }
    if (moreDataController.text.isEmpty) {
      moreDataController.text = "لا يوجد";
    }
    if (formKey.currentState!.validate() && ro2yaController.text.length > 1) {
      showCustomDialog("تنبيه", "يجب عليك الدفع اولا حتى يتم ارسال الرؤيا", () async {
      
      dataLoaded = true;
      notifyListeners();
      Navigator.pop(context);
      final publicUrl = await uploadToSupabase();
      await supabase.from('explanation').upsert(
        {
          'user_id': supabase.auth.currentUser!.id,
          'ro2ya': ro2yaController.text,
          'user_name': await Supabase.instance.client
              .from("users")
              .select()
              .eq("id", supabase.auth.currentUser!.id)
              .then((value) => value[0]['name']),
          'user_email': supabase.auth.currentUser!.email,
          'ro2ya_name': ro2yaNameController.text,
          'ro2ya_type': index == 1 ? "الفضيه" : "الذهبيه",
          'about_ro2ya': ro2yaType,
          'ro2ya_time': ro2yaTimeController.text,
          'employment_status': employmentStatusController.text,
          'more_data': moreDataController.text,
          'payed': false,
          'age': ageController.text,
          'gender': genderController.text,
          'marital_status': maritalStatusController.text,
          if (publicUrl != "null") 'ro2ya_url': publicUrl
        },
      );
      addNotification(
          "12345", "رؤيا جديده", "تم ارسال رؤيا جديده برجاء ارسالها للمفسر");
      Navigator.pushReplacementNamed(
          context, AppRoutes.paymentScreen,);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تم ارسال الرواية بنجاح')));
      _currentStep = 0;
      ro2yaController.clear();
      ro2yaNameController.clear();
      moreDataController.clear();
      ro2yaTimeController.clear();
      employmentStatusController.clear();
      index = null;
      ro2yaType = '';
      genderController.clear();
      ageController.clear();
      maritalStatusController.clear();
      dataLoaded = false;
      notifyListeners();

      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('برجاء ادخال باقي البيانات المطلوبه')));
    }
  }

  // record
  bool isRecording = false;
  bool isPlaying = false;
  bool saveRecord = false;
  FlutterSoundRecorder? recorder;
  FlutterSoundPlayer? player;
  String? filePath;
  Timer? recordingTimer;
  Timer? countdownTimer;
  int remainingTime = 180;
  Future<void> _initRecorder() async {
    await Permission.microphone.request();
    await recorder!.openRecorder();
    await player!.openPlayer();
  }

  final uuid = Uuid().v4();

  Future<void> startRecording() async {
    final dir = await getApplicationDocumentsDirectory();
    filePath = "${dir.path}/$uuid.aac";
    isRecording = true;
    remainingTime = 180;
    notifyListeners();
    await recorder!.startRecorder(toFile: filePath, codec: Codec.aacADTS);
    recordingTimer = Timer(Duration(minutes: 3), stopRecording);
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> stopRecording() async {
    recordingTimer?.cancel();
    countdownTimer?.cancel();
    await recorder!.stopRecorder();
    isRecording = false;
    saveRecord = true;
    notifyListeners();
  }

  Future<void> playRecording() async {
    if (filePath == null) return;
    await player!.startPlayer(
        fromURI: filePath,
        whenFinished: () {
          isPlaying = false;
          notifyListeners();
        });
    isPlaying = true;
    notifyListeners();
  }

  Future<void> stopPlayRecording() async {
    if (filePath == null) return;
    await player!.stopPlayer();
    isPlaying = false;
    notifyListeners();
  }

  Future<String> uploadToSupabase() async {
    if (filePath == null) return "null";
    final file = File(filePath!);
    final bytes = await file.readAsBytes();
    final fileName = 'records/$uuid.aac';
    await supabase.storage.from('Absher').uploadBinary(fileName, bytes);
    return supabase.storage.from('Absher').getPublicUrl(fileName);
  }

}
