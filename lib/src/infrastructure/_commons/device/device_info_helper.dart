import '../../../domain/auth/device/device_register_request.dart';
import 'device_info_helper_io.dart'
    if (dart.library.js) 'device_info_helper_web.dart';

abstract class DeviceInfoHelper {
  static Future<DeviceRegisterRequest> buildRequest() =>
      DeviceInfoHelperImpl.buildRequest();
}
