import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/device/device_register_request.dart';
import '../../domain/auth/device/i_auth_device_repository.dart';
import '../../infrastructure/_commons/device/device_info_helper.dart';
import '../../infrastructure/_commons/network/user_session.dart';
import '../../presentation/_commons/route/app_router.gr.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IAuthDeviceRepository _deviceRepo;
  SplashBloc(this._deviceRepo) : super(const SplashState.loading()) {
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
      final PageRouteInfo<dynamic> route = token != null
          ? const HomeRoute()
          : OnboardingRoute();

      emit(SplashState.loaded(token != null, route));
    });
  }
}
