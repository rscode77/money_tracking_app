import 'package:sqflite/sqflite.dart';

import '../entities/user_expence.dart';

abstract class ExpencesRepository {
  Future<List<UserExpence>> getExpences({required Database database});
  Future<void> insertExpence({required Database database, required UserExpence userExpence});
}
