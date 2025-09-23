class AuthenticatedUser {
  final int id;
  final String name;
  final String email;
  final bool organizationValidated;

  final DateTime? emailVerifiedAt;
  final DateTime? keycloakTokenExpiresAt;
  final DateTime? keycloakRefreshExpiresAt;
  final String? keycloakSessionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? phoneNumber;
  final int? organizationId;
  final int? serviceId;
  final Map<String, dynamic>? profile;

  const AuthenticatedUser({
    required this.id,
    required this.name,
    required this.email,
    required this.organizationValidated,
    this.emailVerifiedAt,
    this.keycloakTokenExpiresAt,
    this.keycloakRefreshExpiresAt,
    this.keycloakSessionId,
    this.createdAt,
    this.updatedAt,
    this.phoneNumber,
    this.organizationId,
    this.serviceId,
    this.profile,
  });
}
