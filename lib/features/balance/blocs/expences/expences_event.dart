// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'expences_bloc.dart';

abstract class ExpencesEvent extends Equatable {
  const ExpencesEvent();

  @override
  List<Object> get props => [];
}

class InsertUserExpenceEvent extends ExpencesEvent {
  final Database database;

  final UserExpence userExpence;
  const InsertUserExpenceEvent({
    required this.database,
    required this.userExpence,
  });
}

class GetExpencesEvent extends ExpencesEvent {
  final Database database;

  const GetExpencesEvent({
    required this.database,
  });

  @override
  List<Object> get props => [database];
}
