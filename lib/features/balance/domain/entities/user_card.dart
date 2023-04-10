import 'dart:convert';

class UserCard {
  final int? id;
  final String lastFourDigits;
  final double value;
  final String name;

  UserCard({
    required this.id,
    required this.lastFourDigits,
    required this.value,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lastFourDigits': lastFourDigits,
      'value': value,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
