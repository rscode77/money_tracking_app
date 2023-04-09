import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:money_tracking_app/features/balance/domain/data/repositories/expences_repository_impl.dart';
import 'package:money_tracking_app/features/balance/domain/entities/user_expence.dart';
import 'package:sqflite/sqflite.dart';

part 'expences_event.dart';
part 'expences_state.dart';

class ExpencesBloc extends Bloc<ExpencesEvent, ExpencesState> {
  ExpencesBloc() : super(const ExpencesState(spent: 0, userExpences: [])) {
    on<InsertUserExpenceEvent>((event, emit) async {
      await ExpencesRepositoryImpl().insertExpence(
        database: event.database,
        userExpence: event.userExpence,
      );
      add(GetExpencesEvent(database: event.database, user: event.user));
    });
    on<GetExpencesEvent>((event, emit) async {
      var userExpences = await ExpencesRepositoryImpl().getExpences(
        database: event.database,
        user: event.user,
      );
      emit(state.copyWith(userExpences: userExpences));
    });
  }
}
