import 'package:device_info_plus/device_info_plus.dart';

import '../../../domain/auth/device/device_register_request.dart';

class DeviceInfoHelperImpl {
  static Future<DeviceRegisterRequest> buildRequest() async {
    final deviceInfo = DeviceInfoPlugin();
    final web = await deviceInfo.webBrowserInfo;

    final browser = web.browserName.name;
    final os = web.userAgent ?? 'Web';
    const deviceType = 'Web';
    const ip = '0.0.0.0';

    return DeviceRegisterRequest(
      browser: browser,
      operatingSystem: os,
      deviceType: deviceType,
      ipAddress: ip,
    );
  }
}
