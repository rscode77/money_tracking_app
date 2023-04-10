// ignore: depend_on_referenced_packages
import 'package:sqflite_common/sqlite_api.dart';

import '../../entities/user_card.dart';
import '../../repositories/card_repository.dart';

class CardRepositoryImpl extends CardRepository {
  @override
  Future<List<UserCard>> getCards({required Database database}) async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('cards');

    return List.generate(maps.length, (i) {
      return UserCard(
        lastFourDigits: maps[i]['lastFourDigits'],
        id: maps[i]['id'],
        value: maps[i]['value'],
        name: maps[i]['name'],
      );
    });
  }

  @override
  Future<void> insertCard({required Database database, required UserCard userCard}) async {
    final db = database;

    await db.insert(
      'cards',
      userCard.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
