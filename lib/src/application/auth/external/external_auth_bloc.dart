import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/auth/external/i_external_auth_repository.dart';
import '../../../infrastructure/_commons/network/user_session.dart';

part 'external_auth_event.dart';
part 'external_auth_state.dart';
part 'external_auth_bloc.freezed.dart';

class ExternalAuthBloc extends Bloc<ExternalAuthEvent, ExternalAuthState> {
  final IExternalAuthRepository _externalRepo;

  ExternalAuthBloc(this._externalRepo) : super(ExternalAuthState.initial()) {
    on<_GooglePressed>((event, emit) async {
      await _handleAuth(emit, provider: _AuthProvider.google);
    });
    on<_LdapPressed>((event, emit) async {
      await _handleAuth(emit, provider: _AuthProvider.ldap);
    });
    on<_Reset>((event, emit) async {
      emit(state.copyWith(isSubmitting: false, resultOption: none()));
    });
  }

  Future<void> _handleAuth(
    Emitter<ExternalAuthState> emit, {
    required _AuthProvider provider,
  }) async {
    emit(state.copyWith(isSubmitting: true, resultOption: none()));
    // Ensure device token
    final String? deviceToken = await myUserSession.getDeviceToken();
    if (deviceToken == null) {
      emit(state.copyWith(isSubmitting: false));
      return;
    }

    // Call external auth to get redirect url
    const callback = 'easysmi://authcallback';
    final res = provider == _AuthProvider.google
        ? await _externalRepo.google(
            deviceToken: deviceToken,
            local: false,
            callbackUrl: callback,
          )
        : await _externalRepo.ldap(
            deviceToken: deviceToken,
            local: false,
            callbackUrl: callback,
          );

    emit(
      res.fold(
        (l) => state.copyWith(isSubmitting: false, resultOption: some(left(l))),
        (r) => state.copyWith(
          isSubmitting: false,
          resultOption: some(right(r.redirectUrl)),
        ),
      ),
    );
  }
}

enum _AuthProvider { google, ldap }
