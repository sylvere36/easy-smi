class DeviceRegisterRequest {
  final String browser;
  final String operatingSystem;
  final String deviceType;
  final String ipAddress;

  const DeviceRegisterRequest({
    required this.browser,
    required this.operatingSystem,
    required this.deviceType,
    required this.ipAddress,
  });

  Map<String, dynamic> toJson() => {
    'browser': browser,
    'operating_system': operatingSystem,
    'device_type': deviceType,
    'ip_address': ipAddress,
  };
}
