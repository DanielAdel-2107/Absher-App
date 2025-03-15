class InterpreterModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final String email;
  final bool available;

  InterpreterModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.available,
  });

  factory InterpreterModel.fromJson(Map<String, dynamic> json) {
    return InterpreterModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      name: json['name'],
      email: json['email'],
      available: json['available'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'name': name,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'InterpreterModel{id: $id, createdAt: $createdAt, name: $name, email: $email}';
  }
}
