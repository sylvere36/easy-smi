import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/auth/user/authenticated_user.dart';
import '../../../domain/auth/user/i_authenticated_user_repository.dart';
import '../../../infrastructure/_commons/network/user_session.dart';

part 'authenticated_user_event.dart';
part 'authenticated_user_state.dart';
part 'authenticated_user_bloc.freezed.dart';

class AuthenticatedUserBloc
    extends Bloc<AuthenticatedUserEvent, AuthenticatedUserState> {
  final IAuthenticatedUserRepository _repo;
  AuthenticatedUserBloc(this._repo) : super(AuthenticatedUserState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none(), user: null));
      final res = await _repo.getAuthenticatedUser();
      emit(
        res.fold(
          (l) => state.copyWith(isLoading: false, resultOption: some(left(l))),
          (user) => state.copyWith(
            isLoading: false,
            user: user,
            resultOption: some(right(user)),
          ),
        ),
      );
    });
    on<_Reset>((event, emit) async {
      emit(state.copyWith(isLoading: false, resultOption: none(), user: null));
    });
    on<_LogoutRequested>((event, emit) async {
      // Clear all stored sessions without exception
      await myUserSession.logout();
      emit(
        state.copyWith(
          isLoading: false,
          canLogout: true,
          resultOption: none(),
          user: null,
        ),
      );
      emit(state.copyWith(canLogout: null));
    });
  }
}
