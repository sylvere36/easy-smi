import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    String? id,
    String? firstName,
    String? lastName,
    String? authToken,
    String? avatarUrl,
    String? email,
    String? phone,
  }) = _User;
}
