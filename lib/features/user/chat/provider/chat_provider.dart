import 'dart:developer';
import 'package:absher_app/core/notifications/add_notification.dart';
import 'package:absher_app/features/models/chat_model.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  final messageController = TextEditingController();
  static final supabase = Supabase.instance.client;
  var userId = supabase.auth.currentUser!.id;
  final String welcomeMessage =
      "مرحباً بك في تطبيق رؤيا وبشرى🌹أنرت التطبيق وأرجوا أن تكن معي أثناء التعبير ولا تغلق المحادثة 🌹";
  final String endMessage =
      "أسأل الله أن يبلغك كل ما تحب وتتمني وأن يرزقك سعادة الدارين... 🌼فضلاً منك أن تشارك التطبيق مع الأهل والأصدقاء لنقل الفائدة بوركت ونفع الله بك...🤍ولا تنسي ترك تعليقك وتقييمك علي التفسير فرأيك يهمنا ☺️وهو محل تقديرنا واهتمامنا...🤍";
  bool loadChats = false;
  String chatId = '';
  String userRole = '';
  bool ro2yaReturned = false;
  bool doneExplanation = false;
  bool close = false;
  bool delete = false;
  bool showUserDetails = false;
  toggleUserDetails() {
    showUserDetails = !showUserDetails;
    notifyListeners();
  }

  String currentUserId = '';
chatStream({
  required String chatKey,
  required String userId,
}) async {
  chatId = chatKey;
  chatList.clear();
  loadChats = false;
  currentUserId = userId;
  notifyListeners();
  await checkUser();
  await getRo2yaState();
  supabase
      .from('chats')
      .stream(primaryKey: ['id'])
      .eq('id', chatId)
      .listen((event) async {
        if (event.isNotEmpty) {
          final chatData = event.first;
          if (chatData.containsKey('chats') && chatData['chats'] is List) {
            chatList = (chatData['chats'] as List)
                .map((chat) => ChatModel.fromJson(chat))
                .toList();
            notifyListeners();
          }
        }

        await getRo2yaState();
        loadChats = true;
        notifyListeners();
      })
      .onError((error) {
        log('Stream error: ${error.toString()}');
      });
}

  //
  ExplanationModel? explanationModel;
  getRo2yaState() async {
    await supabase
        .from('explanation')
        .select()
        .eq('id', chatId)
        .maybeSingle()
        .then((value) {
      if (value != null) {
        explanationModel = ExplanationModel.fromJson(value);
        ro2yaReturned = value['returned_ro2ya'];
        doneExplanation = value['done_explanation'];
        close = value['close'];
        delete = value['delete_chat'];
        if (doneExplanation || ro2yaReturned || delete) {
          chatList.clear();
        }
        notifyListeners();
      }
    });
  }

  Future<void> sendMessage({required String message}) async {
    if (message.isNotEmpty) {
      try {
        ChatModel newMessage = ChatModel(
          id: userId,
          message: message,
        );
        chatList.add(newMessage);
        notifyListeners();
        await supabase.from('chats').upsert({
          'id': chatId,
          'chats': chatList.map((chat) => chat.toJson()).toList(),
        });
        if (userRole == 'interpreter') {
          addNotification(currentUserId, "رساله جديده", message);
        }
      } catch (e) {
        log('An error occurred: ${e.toString()}');
      }
      messageController.clear();
    }
  }

  Future<void> checkUser() async {
    try {
      final response = await supabase
          .from('users')
          .select('role')
          .eq('id', supabase.auth.currentUser!.id)
          .maybeSingle();

      if (response != null && response.containsKey('role')) {
        userRole = response['role'];
        userId = supabase.auth.currentUser!.id;
        log('User role: $userRole');
      } else {
        log('User role not found.');
      }
    } catch (e) {
      log('An error occurred while checking user: ${e.toString()}');
    }
  }

  explanationRo2ya({required BuildContext context}) async {
    try {
      await supabase.from('explanation').update({
        'chat': true,
        'done_explanation': true,
      }).eq('id', chatId);
      await supabase
          .from('chats')
          .update({'done_explanation': true}).eq('id', chatId);
      loadChats = false;
      notifyListeners();
      Navigator.pop(context);
    } catch (e) {
      log('An error occurred while closing chat: ${e.toString()}');
    }
  }

  returnRo2ya({required BuildContext context}) async {
    try {
      await supabase.from('explanation').update({
        'returned_ro2ya': true,
        'interpreter_id': null,
      }).eq('id', chatId);
      final updateData = {
        'interpreter_close': userRole == "interpreter",
        'user_colse': userRole != "interpreter",
      };
      await supabase.from('chats').update(updateData).eq('id', chatId);
      loadChats = false;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('تم ارجاع الرؤيا الي الشيخ'),
      ));
      Navigator.pop(context);
      notifyListeners();
    } catch (e) {
      log('An error occurred while closing chat: ${e.toString()}');
    }
  }

  selectText({required String text}) async {
    messageController.text = text;
    notifyListeners();
  }

// audio

  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> playRecording(String url) async {
    await _audioPlayer.play(UrlSource(url));
    isPlaying = true;
    notifyListeners();
    _audioPlayer.onPlayerComplete.listen((event) {
      stopPlayRecording();
    });
  }

  Future<void> stopPlayRecording() async {
    await _audioPlayer.stop();
    isPlaying = false;
    notifyListeners();
  }
}
