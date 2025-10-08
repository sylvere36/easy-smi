import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/application/actions/actions_bloc.dart';
import 'src/application/actions/detail/action_detail_bloc.dart';
import 'src/application/audit/audits_bloc.dart';
import 'src/application/audit/detail/audit_detail_bloc.dart';
import 'src/application/auth/external/external_auth_bloc.dart';
import 'src/application/auth/user/authenticated_user_bloc.dart';
import 'src/application/communication/comments_bloc.dart';
import 'src/application/connected/connected_bloc.dart';
import 'src/application/evalutaion/evaluation_bloc.dart';
import 'src/application/events/detail/event_detail_bloc.dart';
import 'src/application/events/events_bloc.dart';
import 'src/application/inspection/detail/inspection_detail_bloc.dart';
import 'src/application/inspection/form/inspection_form_bloc.dart';
import 'src/application/inspection/inspections_bloc.dart';
import 'src/application/organization/organization_bloc.dart';
import 'src/application/permit/detail/permit_detail_bloc.dart';
import 'src/application/permit/permits_bloc.dart';
import 'src/application/splash/splash_bloc.dart';
import 'src/domain/action/i_action_repository.dart';
import 'src/domain/audit/i_audit_repository.dart';
import 'src/domain/auth/device/i_auth_device_repository.dart';
import 'src/domain/auth/external/i_external_auth_repository.dart';
import 'src/domain/auth/user/i_authenticated_user_repository.dart';
import 'src/domain/communication/i_communication_repository.dart';
import 'src/domain/evaluation/i_evaluation_repository.dart';
import 'src/domain/event/i_event_repository.dart';
import 'src/domain/inspection/i_inspection_repository.dart';
import 'src/domain/organization/i_organization_repository.dart';
import 'src/domain/permit/i_permit_repository.dart';
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
import 'src/infrastructure/communication/communication_repository.dart';
import 'src/infrastructure/communication/data_sources/communication_remote_data_source.dart';
import 'src/infrastructure/evaluation/data-source/evaluation_remote_data_source.dart';
import 'src/infrastructure/evaluation/evaluation_repository.dart';
import 'src/infrastructure/event/data-sources/event_remote_data_source.dart';
import 'src/infrastructure/event/event_repository.dart';
import 'src/infrastructure/inspection/data_sources/inspection_remote_data_source.dart';
import 'src/infrastructure/inspection/inspection_repository.dart';
import 'src/infrastructure/organization/data_sources/organization_remote_data_source.dart';
import 'src/infrastructure/organization/organization_repository.dart';
import 'src/infrastructure/permit/data_sources/permit_remote_data_source.dart';
import 'src/infrastructure/permit/permit_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initCore();
  initAuth();
  initOrganization();
  initConnected();
  initSplashScreen();
  initActions();
  initAudits();
  initCommunication();
  initEvents();
  initEvaluations();
  initPermits();
  initInspections();
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

Future<void> initCommunication() async {
  sl.registerLazySingleton<ICommunicationRemoteDataSource>(
    () => CommunicationRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<ICommunicationRepository>(
    () => CommunicationRepository(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerFactory(() => CommentsBloc(repository: sl()));
}

Future<void> initEvents() async {
  sl.registerLazySingleton<IEventRemoteDataSource>(
    () => EventRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IEventRepository>(
    () => EventRepository(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerFactory(() => EventsBloc(repository: sl()));
  sl.registerFactory(() => EventDetailsBloc(repository: sl()));
}

Future<void> initEvaluations() async {
  sl.registerLazySingleton<IEvaluationRemoteDataSource>(
    () => EvaluationRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IEvaluationRepository>(
    () => EvaluationRepository(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerFactory(() => EvaluationsBloc(repository: sl()));
}

Future<void> initPermits() async {
  sl.registerLazySingleton<IPermitRemoteDataSource>(
    () => PermitRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IPermitRepository>(
    () => PermitRepository(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerFactory(() => PermitsBloc(repository: sl()));
  sl.registerFactory(() => PermitDetailBloc(repository: sl()));
}

Future<void> initInspections() async {
  sl.registerLazySingleton<IInspectionRemoteDataSource>(
    () => InspectionRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IInspectionRepository>(
    () => InspectionRepository(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerFactory(() => InspectionsBloc(repository: sl()));
  sl.registerFactory(() => InspectionDetailBloc(repository: sl()));
  sl.registerFactory(() => InspectionFormBloc(repository: sl()));
}
