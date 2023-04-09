import 'package:sqflite/sqflite.dart';

abstract class UserRepository {
  Future<Database> initializeDatabase();
}
