import 'formation_registration_item.dart';

class RegistrationUser {
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
  final int? organizationId;
  final int? serviceId;
  final String? profile;
  final int? organizationValidated;

  RegistrationUser({
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
  });

  factory RegistrationUser.fromJson(
    Map<String, dynamic> json,
  ) => RegistrationUser(
    id: (json['id'] as num?)?.toInt() ?? 0,
    name: (json['name'] as String?) ?? '',
    email: (json['email'] as String?) ?? '',
    emailVerifiedAt: json['email_verified_at'] as String?,
    keycloakTokenExpiresAt: json['keycloak_token_expires_at'] as String?,
    keycloakRefreshExpiresAt: json['keycloak_refresh_expires_at'] as String?,
    keycloakSessionId: json['keycloak_session_id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    phoneNumber: json['phone_number'] as String?,
    organizationId: (json['organization_id'] as num?)?.toInt(),
    serviceId: (json['service_id'] as num?)?.toInt(),
    profile: json['profile'] as String?,
    organizationValidated: (json['organization_validated'] as num?)?.toInt(),
  );
}

class UserFormationsRegistrations {
  final RegistrationUser user;
  final List<FormationRegistrationItem> formations;
  final List<dynamic> skills; // placeholder, API returns [] for now

  UserFormationsRegistrations({
    required this.user,
    required this.formations,
    required this.skills,
  });

  factory UserFormationsRegistrations.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final formationsJson = (data['formation'] as List<dynamic>? ?? const [])
        .whereType<Map<String, dynamic>>()
        .toList();
    return UserFormationsRegistrations(
      user: RegistrationUser.fromJson(
        data['user'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      formations: formationsJson
          .map(FormationRegistrationItem.fromJson)
          .toList(),
      skills: data['Skills'] as List<dynamic>? ?? const [],
    );
  }
}
