import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import 'models/license.dart';
import 'models/organization_settings.dart';
import 'models/organization_user.dart';

abstract class IOrganizationRepository {
  Future<Either<GlobalFailure, OrganizationSettingsResult>>
  getOrganizationSettings({required String email});

  // Join organization using the admin email (from session settings by default)
  Future<Either<GlobalFailure, String>> joinOrganization();

  Future<Either<GlobalFailure, List<OrganizationUser>>> getOrganizationUsers();
}

class OrganizationSettingsResult {
  final OrganizationSettings settings;
  final OrganizationLicense license;
  final String message;
  const OrganizationSettingsResult({
    required this.settings,
    required this.license,
    required this.message,
  });
}

// Note: Failures for this feature are standardized via GlobalFailure
// (see lib/src/domain/_commons/global_failure.dart)
