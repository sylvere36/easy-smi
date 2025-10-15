class OrganizationUserDevice {
  final int id;
  final String? ipAddress;
  final String? operatingSystem;
  final String? browser;
  final String? deviceType;
  final String? deviceToken;
  final int userId;
  final int? isLoggedIn;
  final String? lastLoggedAt;
  final String? createdAt;
  final String? updatedAt;

  OrganizationUserDevice({
    required this.id,
    required this.ipAddress,
    required this.operatingSystem,
    required this.browser,
    required this.deviceType,
    required this.deviceToken,
    required this.userId,
    required this.isLoggedIn,
    required this.lastLoggedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrganizationUserDevice.fromJson(Map<String, dynamic> json) {
    return OrganizationUserDevice(
      id: (json['id'] as num?)?.toInt() ?? 0,
      ipAddress: json['ip_address']?.toString(),
      operatingSystem: json['operating_system']?.toString(),
      browser: json['browser']?.toString(),
      deviceType: json['device_type']?.toString(),
      deviceToken: json['device_token']?.toString(),
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      isLoggedIn: (json['is_logged_in'] as num?)?.toInt(),
      lastLoggedAt: json['last_logged_at']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}

class OrganizationUser {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? keycloakTokenExpiresAt;
  final String? keycloakRefreshExpiresAt;
  final String? keycloakSessionId;
  final String? createdAt;
  final String? updatedAt;
  final String? phoneNumber;
  final int organizationId;
  final int? serviceId;
  final String? profile;
  final int? organizationValidated;
  final OrganizationUserDevice? lastDevice;

  OrganizationUser({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.keycloakTokenExpiresAt,
    required this.keycloakRefreshExpiresAt,
    required this.keycloakSessionId,
    required this.createdAt,
    required this.updatedAt,
    required this.phoneNumber,
    required this.organizationId,
    required this.serviceId,
    required this.profile,
    required this.organizationValidated,
    required this.lastDevice,
  });

  factory OrganizationUser.fromJson(Map<String, dynamic> json) {
    return OrganizationUser(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
      emailVerifiedAt: json['email_verified_at']?.toString(),
      keycloakTokenExpiresAt: json['keycloak_token_expires_at']?.toString(),
      keycloakRefreshExpiresAt: json['keycloak_refresh_expires_at']?.toString(),
      keycloakSessionId: json['keycloak_session_id']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      phoneNumber: json['phone_number']?.toString(),
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      serviceId: (json['service_id'] as num?)?.toInt(),
      profile: json['profile']?.toString(),
      organizationValidated: (json['organization_validated'] as num?)?.toInt(),
      lastDevice: (json['last_device'] is Map<String, dynamic>)
          ? OrganizationUserDevice.fromJson(
              json['last_device'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}
