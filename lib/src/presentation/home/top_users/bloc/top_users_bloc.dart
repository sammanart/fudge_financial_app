import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fudge_financial_app/src/config/enums.dart';
import 'package:fudge_financial_app/src/core/resources/response_state.dart';
import 'package:fudge_financial_app/src/data/models/user.dart';
import 'package:fudge_financial_app/src/domain/repositories/user_repo.dart';
import 'package:meta/meta.dart';

part 'top_users_event.dart';
part 'top_users_state.dart';

class TopUsersBloc extends Bloc<TopUsersEvent, TopUsersState> {
  TopUsersBloc({
    required UserRepository userRepository,
  }) : super(
          const TopUsersState(
            executionState: ExecutionState.initial,
          ),
        ) {
    on<TopUsersEvent>((event, emit) async {
      emit(
        state.copyWith(
          executionState: ExecutionState.loading,
        ),
      );

      final result = await userRepository.getUsers();
      if (result is DataSuccess) {
        emit(
          state.copyWith(
            users: result.data,
            executionState: ExecutionState.ready,
          ),
        );
      } else {
        emit(
          state.copyWith(
            executionState: ExecutionState.error,
          ),
        );
      }
    });
  }
}
