part of 'top_users_bloc.dart';

class TopUsersState extends Equatable {
  final List<User>? users;
  final ExecutionState executionState;
  const TopUsersState({
    this.users,
    required this.executionState,
  });

  TopUsersState copyWith({
    List<User>? users,
    ExecutionState? executionState,
  }) {
    return TopUsersState(
      users: users ?? this.users,
      executionState: executionState ?? this.executionState,
    );
  }

  @override
  List<Object?> get props => [
        users,
        executionState,
      ];
}
