import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/auth/_commons/user/user.dart';
import '../../../domain/organization/models/license.dart';
import '../../../domain/organization/models/organization_settings.dart';
import '../../auth/dtos/auth_response/auth_response_dto.dart';
import '../../auth/dtos/user/user_dto.dart';

const locaLang = 'benin_appart_local_lang';
const devisesStore = 'devises_store';
const appUser = 'APP_USER';
const alreadyShow = 'ALREADY_SHOW';
const orgSettingsKey = 'ORG_SETTINGS';
const orgLicenseKey = 'ORG_LICENSE';
const deviceTokenKey = 'DEVICE_TOKEN';

class UserSession {
  SharedPreferences? preferences;
  UserSession({SharedPreferences? sharedPreferences}) {
    init(sharedPreferences);
  }

  Future<void> init(SharedPreferences? sharedPreferences) async {
    preferences = sharedPreferences ?? await SharedPreferences.getInstance();
  }

  Future<AuthResponseDto?> getUserDto() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    final String? authdtoStore = preferences?.getString(appUser);
    if (authdtoStore == null) return null;
    final AuthResponseDto userDto = AuthResponseDto.fromJson(
      jsonDecode(authdtoStore),
    );
    return userDto;
  }

  Future<String?> getAuthToken() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    final String? authdtoStore = preferences?.getString(appUser);
    if (authdtoStore == null) return null;
    final AuthResponseDto userDto = AuthResponseDto.fromJson(
      jsonDecode(authdtoStore),
    );
    return userDto.token;
  }

  Future<User?> getUser() async {
    preferences = preferences ?? await SharedPreferences.getInstance();
    final String? authdtoStore = preferences?.getString(appUser);
    if (authdtoStore == null) return null;
    final AuthResponseDto userDto = AuthResponseDto.fromJson(
      jsonDecode(authdtoStore),
    );
    return userDto.user!.toDomain();
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
