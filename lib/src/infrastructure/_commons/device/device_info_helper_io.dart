import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/auth/device/device_register_request.dart';

class DeviceInfoHelperImpl {
  static Future<DeviceRegisterRequest> buildRequest() async {
    final deviceInfo = DeviceInfoPlugin();

    String browser = 'N/A';
    String os = 'Unknown';
    String deviceType = 'Unknown';
    final String ip = '0.0.0.0';

    try {
      if (kIsWeb) {
        final web = await deviceInfo.webBrowserInfo;
        browser = web.browserName.name;
        os = web.userAgent ?? 'Web';
        deviceType = 'Web';
      } else if (Platform.isAndroid) {
        final android = await deviceInfo.androidInfo;
        os = 'Android ${android.version.release}';
        deviceType = android.model;
      } else if (Platform.isIOS) {
        final ios = await deviceInfo.iosInfo;
        os = 'iOS ${ios.systemVersion}';
        deviceType = ios.utsname.machine;
      } else if (Platform.isMacOS) {
        final mac = await deviceInfo.macOsInfo;
        os = 'macOS ${mac.osRelease}';
        deviceType = mac.model;
      } else if (Platform.isWindows) {
        final win = await deviceInfo.windowsInfo;
        os = 'Windows ${win.displayVersion}';
        deviceType = 'Windows PC';
      } else if (Platform.isLinux) {
        final linux = await deviceInfo.linuxInfo;
        os = 'Linux ${linux.id}';
        deviceType = linux.prettyName;
      }
    } catch (_) {}

    // Getting a real public IP requires a network call; avoid that here.
    // Local IP via NetworkInterface.list() is platform-permission sensitive; keep fallback.

    return DeviceRegisterRequest(
      browser: browser,
      operatingSystem: os,
      deviceType: deviceType,
      ipAddress: ip,
    );
  }
}
