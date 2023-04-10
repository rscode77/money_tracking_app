// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class InsertCardEvent extends CardEvent {
  final Database database;
  final UserCard userCard;

  const InsertCardEvent({
    required this.database,
    required this.userCard,
  });

  @override
  List<Object> get props => [database, userCard];
}

class GetCardsEvent extends CardEvent {
  final Database database;

  const GetCardsEvent({
    required this.database,
  });

  @override
  List<Object> get props => [database];
}
