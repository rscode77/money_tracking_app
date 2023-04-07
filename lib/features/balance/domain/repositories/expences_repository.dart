import 'package:sqflite/sqflite.dart';

import '../entities/user_expence.dart';

abstract class ExpencesRepository {
  Future<Database> initializeDatabase();
  Future<List<UserExpence>> getExpences();
  Future<UserExpence> getExpence();
  Future<void> insertExpence({required Database database, required UserExpence userExpence});
  Future<void> updateExpence();
  Future<void> deleteExpence();
}
