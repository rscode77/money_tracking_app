import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:money_tracking_app/features/balance/domain/data/repositories/card_repository_impl.dart';
import 'package:money_tracking_app/features/balance/domain/entities/user_card.dart';
import 'package:sqflite/sqflite.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardState(income: 0, userCards: [])) {
    on<InsertCardEvent>((event, emit) async {
      await CardRepositoryImpl().insertCard(
        database: event.database,
        userCard: event.userCard,
      );
      add(GetCardsEvent(database: event.database));
    });
    on<GetCardsEvent>((event, emit) async {
      var userCards = await CardRepositoryImpl().getCards(
        database: event.database,
      );

      double sum = 0;
      for (var c in userCards) {
        sum += c.value;
      }

      emit(state.copyWith(userCards: userCards, income: sum));
    });
  }
}
