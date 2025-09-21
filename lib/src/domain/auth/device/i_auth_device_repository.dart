import 'package:dartz/dartz.dart';

import '../../_commons/global_failure.dart';
import 'device_register_request.dart';

abstract class IAuthDeviceRepository {
  Future<Either<GlobalFailure, String>> registerDevice({
    required DeviceRegisterRequest request,
  });
}
