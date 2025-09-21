import 'package:auto_route/auto_route.dart';

import '../../actions/action_detail_page.dart';
import '../../actions/actions_page.dart';
import '../../auth/sign_in/login.dart';
import '../../auth/sign_in/sign_in_page.dart';
import '../../auth/webview/auth_webview_page.dart';
import '../../comments/comments_page.dart';
import '../../home/home.dart';
import '../../onboarding/onboarding_page.dart';
import '../../profile/degree/profile_degree_page.dart';
import '../../profile/degree/profile_search_degree_page.dart';
import '../../profile/entretien/profile_entretien_page.dart';
import '../../profile/entretien/profile_search_entretien_page.dart';
import '../../profile/formation/profile_formation_page.dart';
import '../../profile/formation/profile_search_formation_page.dart';
import '../../profile/profile_page.dart';
import '../../profile/sensibilisation/profile_search_sensibilization_page.dart';
import '../../profile/sensibilisation/profile_sensibilization_page.dart';
import '../../splash/splash.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
      path: SplashPage.routeName,
    ),
    AutoRoute(page: HomeRoute.page, path: HomePage.routeName),
    AutoRoute(page: LoginRoute.page, path: LoginPage.routeName),
    AutoRoute(page: SignInRoute.page, path: SignInPage.routeName),
    AutoRoute(page: OnboardingRoute.page, path: OnboardingPage.routeName),
    AutoRoute(page: ProfileRoute.page, path: ProfilePage.routeName),
    AutoRoute(
      page: ProfileFormationRoute.page,
      path: ProfileFormationPage.routeName,
    ),
    AutoRoute(
      page: ProfileSearchFormationRoute.page,
      path: ProfileSearchFormationPage.routeName,
    ),
    AutoRoute(page: ProfileDegreeRoute.page, path: ProfileDegreePage.routeName),
    AutoRoute(
      page: ProfileSearchDegreeRoute.page,
      path: ProfileSearchDegreePage.routeName,
    ),
    AutoRoute(
      page: ProfileSensibilizationRoute.page,
      path: ProfileSensibilizationPage.routeName,
    ),
    AutoRoute(
      page: ProfileSearchSensibilizationRoute.page,
      path: ProfileSearchSensibilizationPage.routeName,
    ),
    AutoRoute(
      page: ProfileEntretienRoute.page,
      path: ProfileEntretienPage.routeName,
    ),
    AutoRoute(
      page: ProfileSearchEntretienRoute.page,
      path: ProfileSearchEntretienPage.routeName,
    ),
    AutoRoute(page: CommentsRoute.page, path: CommentsPage.routeName),
    AutoRoute(page: ActionsRoute.page, path: ActionsPage.routeName),
    AutoRoute(page: ActionDetailRoute.page, path: ActionDetailPage.routeName),
    AutoRoute(page: AuthWebViewRoute.page, path: AuthWebViewPage.routeName),
    // AutoRoute(page: Route.page, path: Page.routeName),
  ];
}
