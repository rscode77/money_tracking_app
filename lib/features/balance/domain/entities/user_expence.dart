import 'dart:convert';

class UserExpence {
  final int id;
  final String category;
  final String time;
  final double value;
  final String user;
  UserExpence({
    required this.id,
    required this.category,
    required this.time,
    required this.value,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'time': time,
      'value': value,
      'user': user,
    };
  }

  String toJson() => json.encode(toMap());
}
