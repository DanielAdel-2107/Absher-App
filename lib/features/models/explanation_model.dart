// ignore_for_file: non_constant_identifier_names

class ExplanationModel {
  final String id;
  final String? ro2yaUrl;

  final DateTime createdAt;
  final String userId;
  final String? interpreterId;
  final String ro2ya;
  final String? userFeedback;
  final String userName;
  final String? interpreterName;
  final String? interpreterEmail;
  final String userEmail;
  final String ro2yaName;
  final String? more_data;
  final String? employment_status;
  final String? ro2ya_time;
  final String? ro2ya_type;
  final String? about_ro2ya;
  final String? age;
  final String? gender;
  final String? maritalStatus;
  final bool payed, chat;
  final bool returned_ro2ya,
      visiblity,
      doneExplanation,
      visiblityFeedback,
      close,
      delete_chat;
  final String rating;
  ExplanationModel({
    required this.returned_ro2ya,
    required this.id,
    this.ro2yaUrl,
    required this.createdAt,
    required this.userId,
    required this.interpreterId,
    required this.ro2ya,
    this.userFeedback,
    required this.userName,
    this.interpreterName,
    required this.interpreterEmail,
    required this.userEmail,
    required this.ro2yaName,
    this.employment_status,
    this.more_data,
    this.ro2ya_time,
    this.ro2ya_type,
    this.about_ro2ya,
    required this.payed,
    required this.chat,
    required this.visiblity,
    required this.doneExplanation,
    required this.rating,
    required this.visiblityFeedback,
    required this.close,
    required this.delete_chat,
    this.age,
    this.gender,
    this.maritalStatus,
  });

  factory ExplanationModel.fromJson(Map<String, dynamic> json) {
    return ExplanationModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      userId: json['user_id'],
      interpreterId: json['interpreter_id'],
      ro2ya: json['ro2ya'],
      userFeedback: json['user_feedback'],
      userName: json['user_name'],
      interpreterName: json['interpreter_name'],
      interpreterEmail: json['interpreter_email'],
      userEmail: json['user_email'],
      ro2yaName: json['ro2ya_name'],
      ro2ya_type: json['ro2ya_type'],
      ro2ya_time: json['ro2ya_time'],
      employment_status: json['employment_status'],
      more_data: json['more_data'],
      about_ro2ya: json['about_ro2ya'],
      payed: json['payed'],
      chat: json['chat'],
      returned_ro2ya: json['returned_ro2ya'],
      visiblity: json['visiblity'],
      doneExplanation: json['done_explanation'],
      rating: json['rating'],
      visiblityFeedback: json['visiblity_feedback'],
      close: json["close"],
      delete_chat: json["delete_chat"],
      age: json["age"],
      gender: json["gender"],
      maritalStatus: json["marital_status"],
      ro2yaUrl: json["ro2ya_url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'user_id': userId,
      'interpreter_id': interpreterId,
      'ro2ya': ro2ya,
      'user_feedback': userFeedback,
      'user_name': userName,
      'interpreter_name': interpreterName,
      'interpreter_email': interpreterEmail,
      'user_email': userEmail,
      'ro2ya_name': ro2yaName,
      'ro2ya_type': ro2ya_type,
      'ro2ya_time': ro2ya_time,
      'employment_status': employment_status,
      'more_data': more_data,
      'about_ro2ya': about_ro2ya,
      'payed': payed,
      'chat': chat
    };
  }

  @override
  String toString() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'user_id': userId,
      'interpreter_id': interpreterId,
      'ro2ya': ro2ya,
      'user_feedback': userFeedback,
      'user_name': userName,
      'interpreter_name': interpreterName,
      'interpreter_email': interpreterEmail,
      'user_email': userEmail,
      'ro2ya_name': ro2yaName,
      'ro2ya_type': ro2ya_type,
      'ro2ya_time': ro2ya_time,
      'employment_status': employment_status,
      'more_data': more_data,
      'about_ro2ya': about_ro2ya,
      'payed': payed,
      'chat': chat
    }.toString();
  }
}
