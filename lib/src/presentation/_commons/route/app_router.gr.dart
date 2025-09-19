// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i32;
import 'package:easy_smi/src/presentation/actions/action_detail_page.dart'
    as _i1;
import 'package:easy_smi/src/presentation/actions/actions_page.dart' as _i2;
import 'package:easy_smi/src/presentation/auth/sign_in/login.dart' as _i13;
import 'package:easy_smi/src/presentation/auth/sign_in/sign_in_page.dart'
    as _i28;
import 'package:easy_smi/src/presentation/comments/comments_page.dart' as _i5;
import 'package:easy_smi/src/presentation/formations/certifications/all_certifications_page.dart'
    as _i3;
import 'package:easy_smi/src/presentation/formations/certifications/certification_detail_page.dart'
    as _i4;
import 'package:easy_smi/src/presentation/formations/formations_sensibilizations_page.dart'
    as _i6;
import 'package:easy_smi/src/presentation/formations/certifications/my_certifications_page.dart'
    as _i14;
import 'package:easy_smi/src/presentation/formations/quizz/quizz_page.dart' as _i25;
import 'package:easy_smi/src/presentation/formations/quizz/quizz_responses_page.dart'
    as _i26;
import 'package:easy_smi/src/presentation/formations/quizz/quizz_responses_stats.dart'
    as _i27;
import 'package:easy_smi/src/presentation/home/home.dart' as _i7;
import 'package:easy_smi/src/presentation/inspections/inspection_recent_detail_page.dart'
    as _i8;
import 'package:easy_smi/src/presentation/inspections/inspection_result_page.dart'
    as _i9;
import 'package:easy_smi/src/presentation/inspections/inspection_result_saving_page.dart'
    as _i10;
import 'package:easy_smi/src/presentation/inspections/inspection_section_page.dart'
    as _i11;
import 'package:easy_smi/src/presentation/inspections/inspections_page.dart'
    as _i12;
import 'package:easy_smi/src/presentation/inspections/start_inspection_detail_page.dart'
    as _i30;
import 'package:easy_smi/src/presentation/inspections/start_inspection_page.dart'
    as _i31;
import 'package:easy_smi/src/presentation/onboarding/onboarding_page.dart'
    as _i15;
import 'package:easy_smi/src/presentation/profile/degree/profile_degree_page.dart'
    as _i16;
import 'package:easy_smi/src/presentation/profile/degree/profile_search_degree_page.dart'
    as _i20;
import 'package:easy_smi/src/presentation/profile/entretien/profile_entretien_page.dart'
    as _i17;
import 'package:easy_smi/src/presentation/profile/entretien/profile_search_entretien_page.dart'
    as _i21;
import 'package:easy_smi/src/presentation/profile/formation/profile_formation_page.dart'
    as _i18;
import 'package:easy_smi/src/presentation/profile/formation/profile_search_formation_page.dart'
    as _i22;
import 'package:easy_smi/src/presentation/profile/profile_page.dart' as _i19;
import 'package:easy_smi/src/presentation/profile/sensibilisation/profile_search_sensibilization_page.dart'
    as _i23;
import 'package:easy_smi/src/presentation/profile/sensibilisation/profile_sensibilization_page.dart'
    as _i24;
import 'package:easy_smi/src/presentation/splash/splash.dart' as _i29;
import 'package:flutter/material.dart' as _i33;

/// generated route for
/// [_i1.ActionDetailPage]
class ActionDetailRoute extends _i32.PageRouteInfo<void> {
  const ActionDetailRoute({List<_i32.PageRouteInfo>? children})
    : super(ActionDetailRoute.name, initialChildren: children);

  static const String name = 'ActionDetailRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i1.ActionDetailPage();
    },
  );
}

/// generated route for
/// [_i2.ActionsPage]
class ActionsRoute extends _i32.PageRouteInfo<void> {
  const ActionsRoute({List<_i32.PageRouteInfo>? children})
    : super(ActionsRoute.name, initialChildren: children);

  static const String name = 'ActionsRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i2.ActionsPage();
    },
  );
}

/// generated route for
/// [_i3.AllCertificationsPage]
class AllCertificationsRoute extends _i32.PageRouteInfo<void> {
  const AllCertificationsRoute({List<_i32.PageRouteInfo>? children})
    : super(AllCertificationsRoute.name, initialChildren: children);

  static const String name = 'AllCertificationsRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i3.AllCertificationsPage();
    },
  );
}

/// generated route for
/// [_i4.CertificationDetailPage]
class CertificationDetailRoute extends _i32.PageRouteInfo<void> {
  const CertificationDetailRoute({List<_i32.PageRouteInfo>? children})
    : super(CertificationDetailRoute.name, initialChildren: children);

  static const String name = 'CertificationDetailRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i4.CertificationDetailPage();
    },
  );
}

/// generated route for
/// [_i5.CommentsPage]
class CommentsRoute extends _i32.PageRouteInfo<void> {
  const CommentsRoute({List<_i32.PageRouteInfo>? children})
    : super(CommentsRoute.name, initialChildren: children);

  static const String name = 'CommentsRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i5.CommentsPage();
    },
  );
}

/// generated route for
/// [_i6.FormationsSensibilizationsPage]
class FormationsSensibilizationsRoute
    extends _i32.PageRouteInfo<FormationsSensibilizationsRouteArgs> {
  FormationsSensibilizationsRoute({
    _i33.Key? key,
    int initialPage = 2,
    List<_i32.PageRouteInfo>? children,
  }) : super(
         FormationsSensibilizationsRoute.name,
         args: FormationsSensibilizationsRouteArgs(
           key: key,
           initialPage: initialPage,
         ),
         initialChildren: children,
       );

  static const String name = 'FormationsSensibilizationsRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FormationsSensibilizationsRouteArgs>(
        orElse: () => const FormationsSensibilizationsRouteArgs(),
      );
      return _i6.FormationsSensibilizationsPage(
        key: args.key,
        initialPage: args.initialPage,
      );
    },
  );
}

class FormationsSensibilizationsRouteArgs {
  const FormationsSensibilizationsRouteArgs({this.key, this.initialPage = 2});

  final _i33.Key? key;

  final int initialPage;

  @override
  String toString() {
    return 'FormationsSensibilizationsRouteArgs{key: $key, initialPage: $initialPage}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FormationsSensibilizationsRouteArgs) return false;
    return key == other.key && initialPage == other.initialPage;
  }

  @override
  int get hashCode => key.hashCode ^ initialPage.hashCode;
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i32.PageRouteInfo<void> {
  const HomeRoute({List<_i32.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomePage();
    },
  );
}

/// generated route for
/// [_i8.InpectionRecentDetailPage]
class InpectionRecentDetailRoute extends _i32.PageRouteInfo<void> {
  const InpectionRecentDetailRoute({List<_i32.PageRouteInfo>? children})
    : super(InpectionRecentDetailRoute.name, initialChildren: children);

  static const String name = 'InpectionRecentDetailRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i8.InpectionRecentDetailPage();
    },
  );
}

/// generated route for
/// [_i9.InspectionResultPage]
class InspectionResultRoute extends _i32.PageRouteInfo<void> {
  const InspectionResultRoute({List<_i32.PageRouteInfo>? children})
    : super(InspectionResultRoute.name, initialChildren: children);

  static const String name = 'InspectionResultRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i9.InspectionResultPage();
    },
  );
}

/// generated route for
/// [_i10.InspectionResultSavingPage]
class InspectionResultSavingRoute extends _i32.PageRouteInfo<void> {
  const InspectionResultSavingRoute({List<_i32.PageRouteInfo>? children})
    : super(InspectionResultSavingRoute.name, initialChildren: children);

  static const String name = 'InspectionResultSavingRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i10.InspectionResultSavingPage();
    },
  );
}

/// generated route for
/// [_i11.InspectionSectionPage]
class InspectionSectionRoute extends _i32.PageRouteInfo<void> {
  const InspectionSectionRoute({List<_i32.PageRouteInfo>? children})
    : super(InspectionSectionRoute.name, initialChildren: children);

  static const String name = 'InspectionSectionRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i11.InspectionSectionPage();
    },
  );
}

/// generated route for
/// [_i12.InspectionsPage]
class InspectionsRoute extends _i32.PageRouteInfo<void> {
  const InspectionsRoute({List<_i32.PageRouteInfo>? children})
    : super(InspectionsRoute.name, initialChildren: children);

  static const String name = 'InspectionsRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i12.InspectionsPage();
    },
  );
}

/// generated route for
/// [_i13.LoginPage]
class LoginRoute extends _i32.PageRouteInfo<void> {
  const LoginRoute({List<_i32.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i13.LoginPage();
    },
  );
}

/// generated route for
/// [_i14.MyCertificationsPage]
class MyCertificationsRoute extends _i32.PageRouteInfo<void> {
  const MyCertificationsRoute({List<_i32.PageRouteInfo>? children})
    : super(MyCertificationsRoute.name, initialChildren: children);

  static const String name = 'MyCertificationsRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i14.MyCertificationsPage();
    },
  );
}

/// generated route for
/// [_i15.OnboardingPage]
class OnboardingRoute extends _i32.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i33.Key? key,
    _i33.VoidCallback? onFinish,
    List<_i32.PageRouteInfo>? children,
  }) : super(
         OnboardingRoute.name,
         args: OnboardingRouteArgs(key: key, onFinish: onFinish),
         initialChildren: children,
       );

  static const String name = 'OnboardingRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>(
        orElse: () => const OnboardingRouteArgs(),
      );
      return _i15.OnboardingPage(key: args.key, onFinish: args.onFinish);
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key, this.onFinish});

  final _i33.Key? key;

  final _i33.VoidCallback? onFinish;

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
/// [_i16.ProfileDegreePage]
class ProfileDegreeRoute extends _i32.PageRouteInfo<void> {
  const ProfileDegreeRoute({List<_i32.PageRouteInfo>? children})
    : super(ProfileDegreeRoute.name, initialChildren: children);

  static const String name = 'ProfileDegreeRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i16.ProfileDegreePage();
    },
  );
}

/// generated route for
/// [_i17.ProfileEntretienPage]
class ProfileEntretienRoute extends _i32.PageRouteInfo<void> {
  const ProfileEntretienRoute({List<_i32.PageRouteInfo>? children})
    : super(ProfileEntretienRoute.name, initialChildren: children);

  static const String name = 'ProfileEntretienRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i17.ProfileEntretienPage();
    },
  );
}

/// generated route for
/// [_i18.ProfileFormationPage]
class ProfileFormationRoute extends _i32.PageRouteInfo<void> {
  const ProfileFormationRoute({List<_i32.PageRouteInfo>? children})
    : super(ProfileFormationRoute.name, initialChildren: children);

  static const String name = 'ProfileFormationRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i18.ProfileFormationPage();
    },
  );
}

/// generated route for
/// [_i19.ProfilePage]
class ProfileRoute extends _i32.PageRouteInfo<void> {
  const ProfileRoute({List<_i32.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i19.ProfilePage();
    },
  );
}

/// generated route for
/// [_i20.ProfileSearchDegreePage]
class ProfileSearchDegreeRoute extends _i32.PageRouteInfo<void> {
  const ProfileSearchDegreeRoute({List<_i32.PageRouteInfo>? children})
    : super(ProfileSearchDegreeRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchDegreeRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i20.ProfileSearchDegreePage();
    },
  );
}

/// generated route for
/// [_i21.ProfileSearchEntretienPage]
class ProfileSearchEntretienRoute extends _i32.PageRouteInfo<void> {
  const ProfileSearchEntretienRoute({List<_i32.PageRouteInfo>? children})
    : super(ProfileSearchEntretienRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchEntretienRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i21.ProfileSearchEntretienPage();
    },
  );
}

/// generated route for
/// [_i22.ProfileSearchFormationPage]
class ProfileSearchFormationRoute extends _i32.PageRouteInfo<void> {
  const ProfileSearchFormationRoute({List<_i32.PageRouteInfo>? children})
    : super(ProfileSearchFormationRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchFormationRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i22.ProfileSearchFormationPage();
    },
  );
}

/// generated route for
/// [_i23.ProfileSearchSensibilizationPage]
class ProfileSearchSensibilizationRoute extends _i32.PageRouteInfo<void> {
  const ProfileSearchSensibilizationRoute({List<_i32.PageRouteInfo>? children})
    : super(ProfileSearchSensibilizationRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchSensibilizationRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i23.ProfileSearchSensibilizationPage();
    },
  );
}

/// generated route for
/// [_i24.ProfileSensibilizationPage]
class ProfileSensibilizationRoute extends _i32.PageRouteInfo<void> {
  const ProfileSensibilizationRoute({List<_i32.PageRouteInfo>? children})
    : super(ProfileSensibilizationRoute.name, initialChildren: children);

  static const String name = 'ProfileSensibilizationRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i24.ProfileSensibilizationPage();
    },
  );
}

/// generated route for
/// [_i25.QuizzPage]
class QuizzRoute extends _i32.PageRouteInfo<void> {
  const QuizzRoute({List<_i32.PageRouteInfo>? children})
    : super(QuizzRoute.name, initialChildren: children);

  static const String name = 'QuizzRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i25.QuizzPage();
    },
  );
}

/// generated route for
/// [_i26.QuizzResponsesPage]
class QuizzResponsesRoute extends _i32.PageRouteInfo<void> {
  const QuizzResponsesRoute({List<_i32.PageRouteInfo>? children})
    : super(QuizzResponsesRoute.name, initialChildren: children);

  static const String name = 'QuizzResponsesRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i26.QuizzResponsesPage();
    },
  );
}

/// generated route for
/// [_i27.QuizzResponsesStatsPage]
class QuizzResponsesStatsRoute extends _i32.PageRouteInfo<void> {
  const QuizzResponsesStatsRoute({List<_i32.PageRouteInfo>? children})
    : super(QuizzResponsesStatsRoute.name, initialChildren: children);

  static const String name = 'QuizzResponsesStatsRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i27.QuizzResponsesStatsPage();
    },
  );
}

/// generated route for
/// [_i28.SignInPage]
class SignInRoute extends _i32.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i33.Key? key,
    required String email,
    List<_i32.PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>();
      return _i28.SignInPage(key: args.key, email: args.email);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, required this.email});

  final _i33.Key? key;

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
/// [_i29.SplashPage]
class SplashRoute extends _i32.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i33.Key? key,
    bool? withDeepLink,
    bool? fromLogout,
    List<_i32.PageRouteInfo>? children,
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

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashRouteArgs>(
        orElse: () => const SplashRouteArgs(),
      );
      return _i29.SplashPage(
        key: args.key,
        withDeepLink: args.withDeepLink,
        fromLogout: args.fromLogout,
      );
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key, this.withDeepLink, this.fromLogout});

  final _i33.Key? key;

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

/// generated route for
/// [_i30.StartInspectionDetailPage]
class StartInspectionDetailRoute extends _i32.PageRouteInfo<void> {
  const StartInspectionDetailRoute({List<_i32.PageRouteInfo>? children})
    : super(StartInspectionDetailRoute.name, initialChildren: children);

  static const String name = 'StartInspectionDetailRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i30.StartInspectionDetailPage();
    },
  );
}

/// generated route for
/// [_i31.StartInspectionPage]
class StartInspectionRoute extends _i32.PageRouteInfo<void> {
  const StartInspectionRoute({List<_i32.PageRouteInfo>? children})
    : super(StartInspectionRoute.name, initialChildren: children);

  static const String name = 'StartInspectionRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i31.StartInspectionPage();
    },
  );
}
