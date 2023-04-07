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
  Future<List<UserExpence>> getExpences() {
    // TODO: implement getExpences
    throw UnimplementedError();
  }

  @override
  Future<void> updateExpence() {
    // TODO: implement updateExpence
    throw UnimplementedError();
  }

  @override
  Future<Database> initializeDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'expences_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE expences(id INTEGER PRIMARY KEY, category TEXT, value FLOAT, lastFourDigits INTEGER)',
        );
      },
      version: 1,
    );
    return database;
  }
}
