part of 'card_bloc.dart';

class CardState extends Equatable {
  const CardState({
    required this.income,
    required this.userCards,
  });

  final double income;
  final List<UserCard> userCards;

  @override
  List<Object> get props => [income, userCards];

  CardState copyWith({
    double? income,
    List<UserCard>? userCards,
  }) {
    return CardState(
      income: income ?? this.income,
      userCards: userCards ?? this.userCards,
    );
  }
}
