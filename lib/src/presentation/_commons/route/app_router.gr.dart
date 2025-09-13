// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:easy_smi/src/presentation/auth/sign_in/login.dart' as _i2;
import 'package:easy_smi/src/presentation/auth/sign_in/sign_in_page.dart'
    as _i13;
import 'package:easy_smi/src/presentation/home/home.dart' as _i1;
import 'package:easy_smi/src/presentation/onboarding/onboarding_page.dart'
    as _i3;
import 'package:easy_smi/src/presentation/profile/degree/profile_degree_page.dart'
    as _i4;
import 'package:easy_smi/src/presentation/profile/degree/profile_search_degree_page.dart'
    as _i8;
import 'package:easy_smi/src/presentation/profile/entretien/profile_entretien_page.dart'
    as _i5;
import 'package:easy_smi/src/presentation/profile/entretien/profile_search_entretien_page.dart'
    as _i9;
import 'package:easy_smi/src/presentation/profile/formation/profile_formation_page.dart'
    as _i6;
import 'package:easy_smi/src/presentation/profile/formation/profile_search_formation_page.dart'
    as _i10;
import 'package:easy_smi/src/presentation/profile/profile_page.dart' as _i7;
import 'package:easy_smi/src/presentation/profile/sensibilisation/profile_search_sensibilization_page.dart'
    as _i11;
import 'package:easy_smi/src/presentation/profile/sensibilisation/profile_sensibilization_page.dart'
    as _i12;
import 'package:easy_smi/src/presentation/splash/splash.dart' as _i14;
import 'package:flutter/material.dart' as _i16;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute({List<_i15.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i15.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i16.Key? key,
    _i16.VoidCallback? onFinish,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         OnboardingRoute.name,
         args: OnboardingRouteArgs(key: key, onFinish: onFinish),
         initialChildren: children,
       );

  static const String name = 'OnboardingRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>(
        orElse: () => const OnboardingRouteArgs(),
      );
      return _i3.OnboardingPage(key: args.key, onFinish: args.onFinish);
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key, this.onFinish});

  final _i16.Key? key;

  final _i16.VoidCallback? onFinish;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key, onFinish: $onFinish}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingRouteArgs) return false;
    return key == other.key && onFinish == other.onFinish;
  }

  @override
  int get hashCode => key.hashCode ^ onFinish.hashCode;
}

/// generated route for
/// [_i4.ProfileDegreePage]
class ProfileDegreeRoute extends _i15.PageRouteInfo<void> {
  const ProfileDegreeRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileDegreeRoute.name, initialChildren: children);

  static const String name = 'ProfileDegreeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfileDegreePage();
    },
  );
}

/// generated route for
/// [_i5.ProfileEntretienPage]
class ProfileEntretienRoute extends _i15.PageRouteInfo<void> {
  const ProfileEntretienRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileEntretienRoute.name, initialChildren: children);

  static const String name = 'ProfileEntretienRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileEntretienPage();
    },
  );
}

/// generated route for
/// [_i6.ProfileFormationPage]
class ProfileFormationRoute extends _i15.PageRouteInfo<void> {
  const ProfileFormationRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileFormationRoute.name, initialChildren: children);

  static const String name = 'ProfileFormationRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileFormationPage();
    },
  );
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfilePage();
    },
  );
}

/// generated route for
/// [_i8.ProfileSearchDegreePage]
class ProfileSearchDegreeRoute extends _i15.PageRouteInfo<void> {
  const ProfileSearchDegreeRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileSearchDegreeRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchDegreeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileSearchDegreePage();
    },
  );
}

/// generated route for
/// [_i9.ProfileSearchEntretienPage]
class ProfileSearchEntretienRoute extends _i15.PageRouteInfo<void> {
  const ProfileSearchEntretienRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileSearchEntretienRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchEntretienRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileSearchEntretienPage();
    },
  );
}

/// generated route for
/// [_i10.ProfileSearchFormationPage]
class ProfileSearchFormationRoute extends _i15.PageRouteInfo<void> {
  const ProfileSearchFormationRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileSearchFormationRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchFormationRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfileSearchFormationPage();
    },
  );
}

/// generated route for
/// [_i11.ProfileSearchSensibilizationPage]
class ProfileSearchSensibilizationRoute extends _i15.PageRouteInfo<void> {
  const ProfileSearchSensibilizationRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileSearchSensibilizationRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchSensibilizationRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfileSearchSensibilizationPage();
    },
  );
}

/// generated route for
/// [_i12.ProfileSensibilizationPage]
class ProfileSensibilizationRoute extends _i15.PageRouteInfo<void> {
  const ProfileSensibilizationRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileSensibilizationRoute.name, initialChildren: children);

  static const String name = 'ProfileSensibilizationRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProfileSensibilizationPage();
    },
  );
}

/// generated route for
/// [_i13.SignInPage]
class SignInRoute extends _i15.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i16.Key? key,
    required String email,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>();
      return _i13.SignInPage(key: args.key, email: args.email);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, required this.email});

  final _i16.Key? key;

  final String email;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}

/// generated route for
/// [_i14.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i16.Key? key,
    bool? withDeepLink,
    bool? fromLogout,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         SplashRoute.name,
         args: SplashRouteArgs(
           key: key,
           withDeepLink: withDeepLink,
           fromLogout: fromLogout,
         ),
         initialChildren: children,
       );

  static const String name = 'SplashRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashRouteArgs>(
        orElse: () => const SplashRouteArgs(),
      );
      return _i14.SplashPage(
        key: args.key,
        withDeepLink: args.withDeepLink,
        fromLogout: args.fromLogout,
      );
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key, this.withDeepLink, this.fromLogout});

  final _i16.Key? key;

  final bool? withDeepLink;

  final bool? fromLogout;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, withDeepLink: $withDeepLink, fromLogout: $fromLogout}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SplashRouteArgs) return false;
    return key == other.key &&
        withDeepLink == other.withDeepLink &&
        fromLogout == other.fromLogout;
  }

  @override
  int get hashCode =>
      key.hashCode ^ withDeepLink.hashCode ^ fromLogout.hashCode;
}
