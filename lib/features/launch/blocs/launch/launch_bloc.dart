import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:sqflite/sqflite.dart';

import '../../data/repositories/user_repository_impl.dart';

part 'launch_event.dart';
part 'launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  LaunchBloc() : super(const LaunchState(database: null)) {
    on<InitDatabse>((event, emit) async {
      var database = await UserRepositoryImpl().initializeDatabase();
      emit(state.copyWith(database: database));
    });
  }
}
