import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../injection_container.dart';
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
    preferences = preferences ?? await SharedPreferences.getInstance();
    return await preferences?.clear();
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
}
