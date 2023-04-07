import 'package:flutter/material.dart';

import '../entities/user_card.dart';

abstract class CardRepository {
  Future<List<UserCard>> getCards();
  Future<UserCard> getCard();
  Future<void> addCard();
  Future<void> updateCard();
  Future<void> deleteCard();
}
