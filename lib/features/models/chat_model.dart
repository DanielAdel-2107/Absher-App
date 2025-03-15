class ChatModel {
  final String id;
  final String message;
  final bool? userchatClosed, interpreterchatClosed;
  ChatModel({
    required this.id,
    required this.message,
    this.userchatClosed = false,
    this.interpreterchatClosed = false,
  });
  factory ChatModel.fromJson(dynamic json) {
    return ChatModel(
      id: json["id"],
      message: json["message"],
      userchatClosed: json["user_colse"],
      interpreterchatClosed: json["interpreter_close"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
    };
  }

  @override
  String toString() {
    return '{id: $id, message: $message}';
  }
}
