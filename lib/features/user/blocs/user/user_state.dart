part of 'user_bloc.dart';

class UserState extends Equatable {
  final Database? database;
  final String? user;

  const UserState({
    required this.database,
    required this.user,
  });

  @override
  List<Object?> get props => [database, user];

  UserState copyWith({
    Database? database,
    String? user,
  }) {
    return UserState(
      user: user ?? this.user,
      database: database ?? this.database,
    );
  }
}
