import 'package:dartz/dartz.dart';

import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/auth_device_remote_data_source.dart';
import '../../domain/_commons/global_failure.dart';
import '../../domain/auth/device/device_register_request.dart';
import '../../domain/auth/device/i_auth_device_repository.dart';

class AuthDeviceRepository implements IAuthDeviceRepository {
  final INetworkInfo networkInfo;
  final IAuthDeviceRemoteDataSource remoteDataSource;

  AuthDeviceRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, String>> registerDevice({
    required DeviceRegisterRequest request,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final token = await remoteDataSource.registerDevice(request: request);
        return right(token);
      } on UnauthorizedException catch (e) {
        return left(GlobalFailure.unauthorized(e.errorText));
      } on ServerException catch (e) {
        return left(GlobalFailure.serverError(e.errorText));
      }
    }
    return left(const GlobalFailure.noNetwork());
  }
}
