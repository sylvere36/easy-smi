import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  if (EmailValidator.validate(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length < 9) {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
  if (!input.contains(RegExp(r'[a-z]'))) {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
  if (!input.contains(RegExp(r'[0-9]'))) {
    return left(ValueFailure.passwordWithoutNumber(failedValue: input));
  }
  if (!input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return left(ValueFailure.passwordWithoutSpecialChar(failedValue: input));
  }
  return right(input);
}
