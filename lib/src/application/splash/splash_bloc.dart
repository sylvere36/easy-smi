import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/_commons/network/user_session.dart';
import '../../domain/auth/device/device_register_request.dart';
import '../../domain/auth/device/i_auth_device_repository.dart';
import '../../presentation/_commons/route/app_router.gr.dart';
import '../../infrastructure/_commons/device/device_info_helper.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserSession _userSession;
  final IAuthDeviceRepository _deviceRepo;
  SplashBloc(this._userSession, this._deviceRepo)
    : super(const SplashState.loading()) {
    on<SplashEvent>((event, emit) {});
    on<StartLoading>((event, emit) async {
      await Future.delayed(Duration(seconds: event.splashTime));
      final String? token = await _userSession.getAuthToken();
      // Register device if not already registered
      final String? deviceToken = await _userSession.getDeviceToken();
      if (deviceToken == null) {
        // Build dynamic device info via device_info_plus
        final DeviceRegisterRequest req = await DeviceInfoHelper.buildRequest();
        final res = await _deviceRepo.registerDevice(request: req);
        await res.fold(
          (_) async {},
          (token) async => _userSession.cacheDeviceToken(token),
        );
      }
      //bool? introIsShow = await _userSession.checkIntroIsShow();
      final PageRouteInfo<dynamic> route = OnboardingRoute();
      // final PageRouteInfo<dynamic> route = OnboardingRoute();
      // token != null
      // ? const HomeRoute()
      // : const LoginRoute();

      emit(SplashState.loaded(token != null, route));
    });
  }
}
