// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreate _$UserCreateFromJson(Map<String, dynamic> json) => UserCreate(
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  sexe: json['sexe'] as String?,
  adress: json['adress'] as String?,
  countryCode: json['countryCode'] as String?,
  country: json['country'] as String?,
  countryName: json['country_name'] as String?,
  phone: json['phone'] as String?,
  defaultRole: json['default_role'] as String?,
  password: json['password'] as String?,
)..profilImage = json['profil_image'] as String?;

Map<String, dynamic> _$UserCreateToJson(UserCreate instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.username,
      'email': instance.email,
      'sexe': instance.sexe,
      'adress': instance.adress,
      'countryCode': instance.countryCode,
      'country': instance.country,
      'phone': instance.phone,
      'country_name': instance.countryName,
      'default_role': instance.defaultRole,
      'password': instance.password,
      'profil_image': instance.profilImage,
    };
