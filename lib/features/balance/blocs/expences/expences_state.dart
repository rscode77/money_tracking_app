// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'expences_bloc.dart';

class ExpencesState extends Equatable {
  const ExpencesState({
    required this.database,
    required this.userExpences,
    required this.spent,
  });

  final Database? database;
  final List<UserExpence> userExpences;
  final double spent;

  @override
  List<Object?> get props => [database, userExpences, spent];

  ExpencesState copyWith({
    Database? database,
    List<UserExpence>? userExpences,
    double? spent,
  }) {
    return ExpencesState(
      database: database ?? this.database,
      userExpences: userExpences ?? this.userExpences,
      spent: spent ?? this.spent,
    );
  }
}
