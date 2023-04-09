// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'expences_bloc.dart';

class ExpencesState extends Equatable {
  const ExpencesState({
    required this.userExpences,
    required this.spent,
  });

  final List<UserExpence> userExpences;
  final double spent;

  @override
  List<Object?> get props => [userExpences, spent];

  ExpencesState copyWith({
    Database? database,
    List<UserExpence>? userExpences,
    double? spent,
  }) {
    return ExpencesState(
      userExpences: userExpences ?? this.userExpences,
      spent: spent ?? this.spent,
    );
  }
}
