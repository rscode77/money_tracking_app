import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../entities/user_expence.dart';
import '../../repositories/expences_repository.dart';

class ExpencesRepositoryImpl extends ExpencesRepository {
  @override
  Future<void> insertExpence({required Database database, required UserExpence userExpence}) async {
    final db = database;

    await db.insert(
      'expences',
      userExpence.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteExpence() {
    // TODO: implement deleteExpence
    throw UnimplementedError();
  }

  @override
  Future<UserExpence> getExpence() {
    // TODO: implement getExpence
    throw UnimplementedError();
  }

  @override
  Future<List<UserExpence>> getExpences({
    required Database database,
    required String user,
  }) async {
    final db = database;

    final List<Map<String, dynamic>> maps = await db.query('expences');

    return List.generate(maps.length, (i) {
      return UserExpence(
        id: maps[i]['id'],
        category: maps[i]['category'],
        value: maps[i]['value'],
        time: maps[i]['time'],
        user: maps[i]['user'],
      );
    });
  }

  @override
  Future<void> updateExpence() {
    // TODO: implement updateExpence
    throw UnimplementedError();
  }
}
