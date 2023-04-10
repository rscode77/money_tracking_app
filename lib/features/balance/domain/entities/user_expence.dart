import 'dart:convert';

class UserExpence {
  final int? id;
  final String category;
  final String time;
  final double value;

  UserExpence({
    required this.id,
    required this.category,
    required this.time,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'time': time,
      'value': value,
    };
  }

  String toJson() => json.encode(toMap());
}
