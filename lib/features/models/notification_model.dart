class NotificationModel {
  final String title;
  final String message;

  NotificationModel({required this.title, required this.message});
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json['title'],
        message: json['message'],
      );
}
