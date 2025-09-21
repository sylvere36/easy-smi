import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/application/auth/external/external_auth_bloc.dart';
import 'src/application/connected/connected_bloc.dart';
import 'src/application/organization/organization_bloc.dart';
import 'src/application/splash/splash_bloc.dart';
import 'src/domain/auth/_commons/i_auth_repository.dart';
import 'src/domain/auth/device/i_auth_device_repository.dart';
import 'src/domain/auth/external/i_external_auth_repository.dart';
import 'src/domain/organization/i_organization_repository.dart';
import 'src/infrastructure/_commons/network/app_requests.dart';
import 'src/infrastructure/_commons/network/network_info.dart';
import 'src/infrastructure/_commons/network/user_session.dart';
import 'src/infrastructure/auth/auth_device_repository.dart';
import 'src/infrastructure/auth/auth_repository.dart';
import 'src/infrastructure/auth/data_sources/auth_device_remote_data_source.dart';
import 'src/infrastructure/auth/data_sources/auth_local_data_source.dart';
import 'src/infrastructure/auth/data_sources/auth_remote_data_source.dart';
import 'src/infrastructure/auth/data_sources/external_auth_remote_data_source.dart';
import 'src/infrastructure/auth/external_auth_repository.dart';
import 'src/infrastructure/organization/data_sources/organization_remote_data_source.dart';
import 'src/infrastructure/organization/organization_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initCore();
  initSplashScreen();
  initAuth();
  initConnected();
  initOrganization();
}

void initSplashScreen() {
  sl.registerFactory(() => SplashBloc(sl(), sl()));
}

Future<void> initCore() async {
  sl.registerFactory(() => Connectivity());
  sl.registerFactory(() => UserSession());
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(connectivity: sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  //final firebaseMessaging = FirebaseMessaging.instance;
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  //sl.registerLazySingleton<FirebaseMessaging>(() => firebaseMessaging);
  sl.registerLazySingleton<IAppRequests>(() => AppRequests());
}

Future<void> initAuth() async {
  sl.registerLazySingleton<IAuthLocalDataSource>(
    () => AuthLocalDataSource(sharedPreferences: sl(), userSession: sl()),
  );
  sl.registerLazySingleton<IAuthRemoteDataSource>(
    () => AuthRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );
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
  sl.registerFactory(() => ExternalAuthBloc(sl(), sl(), sl()));
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
  sl.registerFactory(() => OrganizationBloc(repository: sl(), session: sl()));
}
