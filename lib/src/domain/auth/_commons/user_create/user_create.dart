import 'package:json_annotation/json_annotation.dart';

part 'user_create.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class UserCreate {
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? username;
  String? email;
  String? sexe;
  String? adress;
  String? countryCode;
  String? country;
  String? phone;
  @JsonKey(name: 'country_name')
  String? countryName;
  @JsonKey(name: 'default_role')
  String? defaultRole;
  String? password;
  @JsonKey(name: 'profil_image')
  String? profilImage;

  // ignore: prefer_const_constructors_in_immutables
  UserCreate({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.sexe,
    this.adress,
    this.countryCode,
    this.country,
    this.countryName,
    this.phone,
    this.defaultRole,
    this.password,
  });

  bool get isvalid =>
      firstName != null &&
      lastName != null &&
      email != null &&
      phone != null &&
      password != null;

  factory UserCreate.fromJson(Map<String, dynamic> json) {
    return _$UserCreateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserCreateToJson(this);
}
