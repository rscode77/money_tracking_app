import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:path/path.dart';

import '../../repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Database> initializeDatabase() async {
    await deleteDatabase('expences_database.db');
    final database = openDatabase(
      join(await getDatabasesPath(), 'expences_database.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE expences(id INTEGER PRIMARY KEY, category TEXT, value FLOAT, time TEXT, user TEXT)'
            //  +
            //     'CREATE TABLE cards(id INTEGER PRIMARY KEY, lastFourDigits TEXT, value FLOAT, name TEXT, user TEXT)',
            );
      },
      version: 1,
    );
    return database;
  }
}
