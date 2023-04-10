part of 'launch_bloc.dart';

class LaunchState extends Equatable {
  final Database? database;
  const LaunchState({
    required this.database,
  });

  @override
  List<Object?> get props => [database];

  LaunchState copyWith({
    Database? database,
    String? user,
  }) {
    return LaunchState(
      database: database ?? this.database,
    );
  }
}
