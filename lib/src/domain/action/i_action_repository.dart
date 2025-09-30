import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import 'models/action_item.dart';
import 'models/action_task.dart';

abstract class IActionRepository {
  Future<Either<GlobalFailure, List<ActionItem>>> getActions();

  Future<Either<GlobalFailure, List<ActionItem>>> getActionsByOrigin({
    required String originType,
    required int originId,
  });

  Future<Either<GlobalFailure, ActionItem>> getAction({required int id});

  // Requests and workflow actions
  Future<Either<GlobalFailure, String>> requestValidation({
    required int id,
    String? comment,
  });

  Future<Either<GlobalFailure, String>> requestRevision({required int id});

  Future<Either<GlobalFailure, String>> submitRevision({
    required int id,
    String? revisionComment,
  });

  /// Downloads the action document and returns the absolute file path
  Future<Either<GlobalFailure, String>> printActionDocument({required int id});

  /// Returns the list of tasks for a given action
  Future<Either<GlobalFailure, List<ActionTask>>> getTasks({
    required int actionId,
  });

  Future<Either<GlobalFailure, ActionItem>> addImmediateActions({
    required String name,
    required String type,
    required int originId,
    String? justificationType,
    String? justification,
  });
}
