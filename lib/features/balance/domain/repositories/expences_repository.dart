import 'package:sqflite/sqflite.dart';

import '../entities/user_expence.dart';

abstract class ExpencesRepository {
  Future<List<UserExpence>> getExpences({
    required Database database,
    required String user,
  });
  Future<UserExpence> getExpence();
  Future<void> insertExpence({required Database database, required UserExpence userExpence});
  Future<void> updateExpence();
  Future<void> deleteExpence();
}
