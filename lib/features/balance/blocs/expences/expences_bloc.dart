import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:money_tracking_app/features/balance/domain/data/repositories/expences_repository_impl.dart';
import 'package:money_tracking_app/features/balance/domain/entities/user_expence.dart';
import 'package:sqflite/sqflite.dart';

part 'expences_event.dart';
part 'expences_state.dart';

class ExpencesBloc extends Bloc<ExpencesEvent, ExpencesState> {
  ExpencesBloc() : super(const ExpencesState(database: null, spent: 0, userExpences: [])) {
    on<InsertUserExpenceEvent>((event, emit) async {
      await ExpencesRepositoryImpl().insertExpence(database: state.database!, userExpence: event.userExpence);
      add(GetExpencesEvent());
    });
    on<InitExpenceDatabaseEvent>((event, emit) async {
      var database = await ExpencesRepositoryImpl().initializeDatabase();
      emit(state.copyWith(database: database));
    });
    on<GetExpencesEvent>((event, emit) async {
      var userExpences = await ExpencesRepositoryImpl().getExpences(database: state.database!);
      emit(state.copyWith(userExpences: userExpences));
    });
  }
} 
