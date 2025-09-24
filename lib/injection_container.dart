import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/application/actions/actions_bloc.dart';
import 'src/application/actions/detail/action_detail_bloc.dart';
import 'src/application/audit/audits_bloc.dart';
import 'src/application/audit/detail/audit_detail_bloc.dart';
import 'src/application/auth/external/external_auth_bloc.dart';
import 'src/application/auth/user/authenticated_user_bloc.dart';
import 'src/application/connected/connected_bloc.dart';
import 'src/application/organization/organization_bloc.dart';
import 'src/application/splash/splash_bloc.dart';
import 'src/domain/action/i_action_repository.dart';
import 'src/domain/audit/i_audit_repository.dart';
import 'src/domain/auth/device/i_auth_device_repository.dart';
import 'src/domain/auth/external/i_external_auth_repository.dart';
import 'src/domain/auth/user/i_authenticated_user_repository.dart';
import 'src/domain/organization/i_organization_repository.dart';
import 'src/infrastructure/_commons/files/download_service.dart';
import 'src/infrastructure/_commons/network/app_requests.dart';
import 'src/infrastructure/_commons/network/network_info.dart';
import 'src/infrastructure/_commons/network/user_session.dart';
import 'src/infrastructure/action/action_repository.dart';
import 'src/infrastructure/action/data_sources/action_remote_data_source.dart';
import 'src/infrastructure/audit/audit_repository.dart';
import 'src/infrastructure/audit/data_sources/audit_remote_data_source.dart';
import 'src/infrastructure/auth/auth_device_repository.dart';
import 'src/infrastructure/auth/authenticated_user_repository.dart';
import 'src/infrastructure/auth/data_sources/auth_device_remote_data_source.dart';
import 'src/infrastructure/auth/data_sources/authenticated_user_remote_data_source.dart';
import 'src/infrastructure/auth/data_sources/external_auth_remote_data_source.dart';
import 'src/infrastructure/auth/external_auth_repository.dart';
import 'src/infrastructure/organization/data_sources/organization_remote_data_source.dart';
import 'src/infrastructure/organization/organization_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initCore();
  initAuth();
  initOrganization();
  initConnected();
  initSplashScreen();
  initActions();
  initAudits();
}

void initSplashScreen() {
  sl.registerFactory(() => SplashBloc(sl(), sl(), sl()));
}

Future<void> initCore() async {
  sl.registerFactory(() => Connectivity());
  sl.registerFactory(() => UserSession());
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(connectivity: sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<IAppRequests>(() => AppRequests());
  // File download service
  sl.registerLazySingleton<IDownloadService>(() => DownloadService());
}

Future<void> initAuth() async {
  // Device register deps
  sl.registerLazySingleton<IAuthDeviceRemoteDataSource>(
    () => AuthDeviceRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IAuthDeviceRepository>(
    () => AuthDeviceRepository(networkInfo: sl(), remoteDataSource: sl()),
  );
  // External auth deps
  sl.registerLazySingleton<IExternalAuthRemoteDataSource>(
    () => ExternalAuthRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IExternalAuthRepository>(
    () => ExternalAuthRepository(networkInfo: sl(), remote: sl()),
  );
  // Bloc for external auth
  sl.registerFactory(() => ExternalAuthBloc(sl()));

  // Authenticated user deps
  sl.registerLazySingleton<IAuthenticatedUserRemoteDataSource>(
    () => AuthenticatedUserRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IAuthenticatedUserRepository>(
    () => AuthenticatedUserRepository(networkInfo: sl(), remote: sl()),
  );
  sl.registerFactory(() => AuthenticatedUserBloc(sl()));
}

Future<void> initConnected() async {
  sl.registerFactory(() => ConnectedBloc());
}

Future<void> initOrganization() async {
  sl.registerLazySingleton<IOrganizationRemoteDataSource>(
    () => OrganizationRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IOrganizationRepository>(
    () => OrganizationRepository(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerFactory(() => OrganizationBloc(repository: sl()));
}

Future<void> initActions() async {
  sl.registerLazySingleton<IActionRemoteDataSource>(
    () => ActionRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IActionRepository>(
    () => ActionRepository(
      networkInfo: sl(),
      remoteDataSource: sl(),
      downloadService: sl(),
    ),
  );
  sl.registerFactory(() => ActionsBloc(repository: sl()));
  sl.registerFactory(() => ActionDetailBloc(repository: sl()));
}

Future<void> initAudits() async {
  sl.registerLazySingleton<IAuditRemoteDataSource>(
    () => AuditRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IAuditRepository>(
    () => AuditRepository(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerFactory(() => AuditsBloc(repository: sl()));
  sl.registerFactory(() => AuditDetailBloc(repository: sl()));
}
