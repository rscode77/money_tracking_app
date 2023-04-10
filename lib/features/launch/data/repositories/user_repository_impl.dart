// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Database> initializeDatabase() async {
    // await deleteDatabase('money_tracking_app.db');
    final database = openDatabase(
      join(await getDatabasesPath(), 'money_tracking_app.db'),
      onCreate: (db, version) {
        db.execute('CREATE TABLE cards(id INTEGER PRIMARY KEY, lastFourDigits TEXT, value FLOAT, name TEXT)');
        return db.execute('CREATE TABLE expences(id INTEGER PRIMARY KEY, category TEXT, value FLOAT, time TEXT)');
      },
      version: 1,
    );
    return database;
  }
}
