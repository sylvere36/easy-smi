import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../domain/_commons/global_failure.dart';

void errorFailureHandle({
  required BuildContext context,
  required GlobalFailure failure,
}) {
  toastification.show(
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 3),
    description: RichText(
      text: TextSpan(
        text: failure.map(
          serverError: (serverError) => serverError.errorText.toString(),
          unauthorized: (unauthorized) => unauthorized.errorText.toString(),
          noNetwork: (noNetwork) => 'Problème de connexion',
        ),
        style: const TextStyle(color: Colors.white),
      ),
    ),
    context: context,
  );
}

void successToast({required BuildContext context, required String msg}) {
  toastification.show(
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 3),
    description: RichText(
      text: TextSpan(
        text: msg,
        style: const TextStyle(color: Colors.white),
      ),
    ),
    context: context,
    alignment: Alignment.topCenter,
    direction: TextDirection.ltr,
  );
}

void errorToast({required BuildContext context, required String msg}) {
  toastification.show(
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 3),
    description: RichText(
      text: TextSpan(
        text: msg,
        style: const TextStyle(color: Colors.white),
      ),
    ),
    context: context,
  );
}

void handleGlobalExceptionToast({
  required BuildContext context,
  required Option<Either<GlobalFailure, Unit>> failureOrSuccessOption,
}) {
  if (failureOrSuccessOption.isSome()) {
    final String? error = failureOrSuccessOption.fold(
      () => null,
      (a) => a.fold(
        (l) => l.map(
          serverError: (val) {
            return val.errorText;
          },
          unauthorized: (val) => val.errorText,
          noNetwork: (val) => 'Problème de connexion',
        ),
        (r) => null,
      ),
    );
    if (error != null) {
      errorToast(context: context, msg: error);
    }
  }
}
