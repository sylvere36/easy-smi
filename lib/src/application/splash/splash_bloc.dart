import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/device/device_register_request.dart';
import '../../domain/auth/device/i_auth_device_repository.dart';
import '../../domain/auth/user/i_authenticated_user_repository.dart';
import '../../domain/organization/i_organization_repository.dart';
import '../../domain/organization/models/license.dart';
import '../../infrastructure/_commons/device/device_info_helper.dart';
import '../../infrastructure/_commons/network/user_session.dart';
import '../../presentation/_commons/route/app_router.gr.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IAuthDeviceRepository _deviceRepo;
  final IAuthenticatedUserRepository _authUserRepo;
  final IOrganizationRepository _organizationRepo;
  SplashBloc(this._deviceRepo, this._authUserRepo, this._organizationRepo)
    : super(const SplashState.loading()) {
    on<SplashEvent>((event, emit) {});
    on<StartLoading>((event, emit) async {
      final String? token = await myUserSession.getAuthToken();

      final String? deviceToken = await myUserSession.getDeviceToken();
      if (deviceToken == null) {
        final DeviceRegisterRequest req = await DeviceInfoHelper.buildRequest();
        log('--- Registering device with info: ${req.toJson()}');
        final res = await _deviceRepo.registerDevice(request: req);
        await res.fold(
          (_) async {},
          (token) async => myUserSession.cacheDeviceToken(token),
        );
      }

      final OrganizationLicense? organizationLicense = await myUserSession
          .getOrganizationLicense();

      PageRouteInfo<dynamic> route = token != null
          ? const HomeRoute()
          : organizationLicense != null
          ? SignInRoute(email: organizationLicense.adminEmail)
          : OnboardingRoute();

      // If logged-in, try to fetch the authenticated user (non-blocking route)
      if (token != null) {
        try {
          final res = await _authUserRepo.getAuthenticatedUser();
          res.fold((f) => log('Authenticated user fetch failed: $f'), (
            u,
          ) async {
            if (u.organizationId == null) {
              await _organizationRepo.joinOrganization();
            }
            if (u.organizationValidated == false) {
              route = const PendingJoinOrganisationRoute();
            }
          });
        } catch (e) {
          log('Authenticated user fetch error: $e');
        }
      }

      log('Request Token: $token');

      emit(SplashState.loaded(token != null, route));
    });
  }
}
