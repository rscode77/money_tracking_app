import 'package:sqflite/sqflite.dart';

import '../entities/user_card.dart';

abstract class CardRepository {
  Future<List<UserCard>> getCards({required Database database});
  Future<void> insertCard({required Database database, required UserCard userCard});
}
