import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../injection_container.dart';
import '../../../domain/auth/user/authenticated_user.dart';
import '../../../domain/organization/models/license.dart';
import '../../../domain/organization/models/organization_settings.dart';

const locaLang = 'local_lang';
const devisesStore = 'devises_store';
const appUser = 'APP_USER';
const alreadyShow = 'ALREADY_SHOW';
const orgSettingsKey = 'ORG_SETTINGS';
const orgLicenseKey = 'ORG_LICENSE';
const deviceTokenKey = 'DEVICE_TOKEN';
const accessTokenKey = 'ACCESS_TOKEN';
const authenticatedUserKey = 'AUTHENTICATED_USER';

final myUserSession = sl<UserSession>();

class UserSession {
  SharedPreferences? preferences;
  UserSession({SharedPreferences? sharedPreferences}) {
    init(sharedPreferences);
  }

  Future<void> init(SharedPreferences? sharedPreferences) async {
    preferences = sharedPreferences ?? await SharedPreferences.getInstance();
  }

  Future<bool?> cacheAuthToken(String token) async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    return await preferences?.setString(accessTokenKey, token);
  }

  Future<String?> getAuthToken() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    return preferences?.getString(accessTokenKey);
  }

  Future<bool?> checkIntroIsShow() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    return preferences?.getBool(alreadyShow);
  }

  Future<bool?> setLocaleLanguage(String localLang) async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    return await preferences?.setString(locaLang, localLang);
  }

  Future<String?> getLocaleLanguage() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    return preferences?.getString(locaLang);
  }

  Future<bool?> logout() async {
    final OrganizationSettings? settings = await getOrganizationSettings();
    final OrganizationLicense? license = await getOrganizationLicense();
    await clearAuthenticatedUser();

    preferences = preferences ?? await SharedPreferences.getInstance();
    await preferences?.clear();
    // Re-cache organization settings and license after clearing all preferences
    // to avoid fetching them again from the server if already cached
    if (settings != null && license != null) {
      await cacheOrganization(settings: settings, license: license);
    }
    return true;
  }

  // Organization storage ----------------------------------------------------
  Future<void> cacheOrganization({
    required OrganizationSettings settings,
    required OrganizationLicense license,
  }) async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    await preferences?.setString(orgSettingsKey, jsonEncode(settings.toJson()));
    await preferences?.setString(orgLicenseKey, jsonEncode(license.toJson()));
  }

  Future<OrganizationSettings?> getOrganizationSettings() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    final raw = preferences?.getString(orgSettingsKey);
    if (raw == null) return null;
    return OrganizationSettings.fromJson(jsonDecode(raw));
  }

  Future<OrganizationLicense?> getOrganizationLicense() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    final raw = preferences?.getString(orgLicenseKey);
    if (raw == null) return null;
    return OrganizationLicense.fromJson(jsonDecode(raw));
  }

  // Device token storage ----------------------------------------------------
  Future<void> cacheDeviceToken(String deviceToken) async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    await preferences?.setString(deviceTokenKey, deviceToken);
  }

  Future<String?> getDeviceToken() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    return preferences?.getString(deviceTokenKey);
  }

  // Authenticated user storage ---------------------------------------------
  Future<void> cacheAuthenticatedUser(AuthenticatedUser user) async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    final map = {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'organization_validated': user.organizationValidated,
    };
    await preferences?.setString(authenticatedUserKey, jsonEncode(map));
  }

  Future<AuthenticatedUser?> getAuthenticatedUser() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    final raw = preferences?.getString(authenticatedUserKey);
    if (raw == null) return null;
    final map = jsonDecode(raw) as Map<String, dynamic>;
    return AuthenticatedUser(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      organizationValidated: map['organization_validated'] as bool,
    );
  }

  Future<void> clearAuthenticatedUser() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    await preferences?.remove(authenticatedUserKey);
  }
}
