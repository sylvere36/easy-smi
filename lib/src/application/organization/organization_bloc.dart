import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/organization/i_organization_repository.dart';
import '../../infrastructure/_commons/network/user_session.dart';

part 'organization_bloc.freezed.dart';
part 'organization_event.dart';
part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  final IOrganizationRepository repository;

  OrganizationBloc({required this.repository})
    : super(OrganizationState.initial()) {
    on<_Fetch>(_onFetch);
  }

  Future<void> _onFetch(_Fetch event, Emitter<OrganizationState> emit) async {
    if (event.email.isEmpty) {
      emit(
        state.copyWith(
          showErrorMessages: true,
          failureOrSuccessOption: some(
            const Left(
              GlobalFailure.serverError('MessagesStrings.allFieldRequired'),
            ),
          ),
        ),
      );
      emit(
        state.copyWith(
          showErrorMessages: false,
          failureOrSuccessOption: none(),
        ),
      );
      return;
    }

    emit(state.copyWith(isSubmitting: true, failureOrSuccessOption: none()));

    final result = await repository.getOrganizationSettings(email: event.email);
    await result.fold(
      (l) async {
        emit(
          state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            failureOrSuccessOption: some(
              const Left(
                Unauthorized(
                  'Email invalide ou email d\'organisation incorrect',
                ),
              ),
            ),
          ),
        );
        emit(
          state.copyWith(
            showErrorMessages: false,
            failureOrSuccessOption: none(),
          ),
        );
      },
      (r) async {
        await myUserSession.cacheOrganization(
          settings: r.settings,
          license: r.license,
        );
        emit(
          state.copyWith(
            isSubmitting: false,
            showErrorMessages: false,
            failureOrSuccessOption: some(Right(r)),
          ),
        );
      },
    );
  }
}
