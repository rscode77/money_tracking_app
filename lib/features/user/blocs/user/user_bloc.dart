import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:money_tracking_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:sqflite/sqflite.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState(database: null, user: '')) {
    on<InitDatabse>((event, emit) async {
      var database = await UserRepositoryImpl().initializeDatabase();
      emit(state.copyWith(database: database, user: 'user'));
    });
  }
}
