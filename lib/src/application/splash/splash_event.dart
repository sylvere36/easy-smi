part of 'splash_bloc.dart';

@freezed
abstract class SplashEvent with _$SplashEvent {
  const factory SplashEvent.startLoading(
    int splashTime,
    String currentLangue,
    bool? withDeepLink,
  ) = StartLoading;
}
