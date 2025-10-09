// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i52;
import 'package:collection/collection.dart' as _i61;
import 'package:easy_smi/src/domain/action/models/action_item.dart' as _i54;
import 'package:easy_smi/src/domain/audit/models/audit_item.dart' as _i55;
import 'package:easy_smi/src/domain/inspection/models/inspection_form_item.dart'
    as _i58;
import 'package:easy_smi/src/domain/permit/models/permit_item.dart' as _i57;
import 'package:easy_smi/src/domain/permit/models/permit_risk_assessment_request.dart'
    as _i60;
import 'package:easy_smi/src/presentation/_commons_widgets/file_preview_page.dart'
    as _i15;
import 'package:easy_smi/src/presentation/actions/action_detail_page.dart'
    as _i1;
import 'package:easy_smi/src/presentation/actions/actions_page.dart' as _i2;
import 'package:easy_smi/src/presentation/audits/audit_control_objectif_page.dart'
    as _i6;
import 'package:easy_smi/src/presentation/audits/audit_detail_page.dart' as _i7;
import 'package:easy_smi/src/presentation/audits/audit_make_constat_page.dart'
    as _i8;
import 'package:easy_smi/src/presentation/audits/audits_page.dart' as _i9;
import 'package:easy_smi/src/presentation/audits/programm_audit_page.dart'
    as _i41;
import 'package:easy_smi/src/presentation/auth/sign_in/join_organisation.dart'
    as _i27;
import 'package:easy_smi/src/presentation/auth/sign_in/pending_join_organisation_page.dart'
    as _i31;
import 'package:easy_smi/src/presentation/auth/sign_in/sign_in_page.dart'
    as _i48;
import 'package:easy_smi/src/presentation/auth/webview/auth_webview_page.dart'
    as _i10;
import 'package:easy_smi/src/presentation/comments/comments_page.dart' as _i13;
import 'package:easy_smi/src/presentation/events/add_new_bad_events_page.dart'
    as _i4;
import 'package:easy_smi/src/presentation/events/bad_events_detail_page.dart'
    as _i11;
import 'package:easy_smi/src/presentation/events/declarate_event_page.dart'
    as _i14;
import 'package:easy_smi/src/presentation/events/new_bad_events_page.dart'
    as _i29;
import 'package:easy_smi/src/presentation/formations/certifications/all_certifications_page.dart'
    as _i5;
import 'package:easy_smi/src/presentation/formations/certifications/certification_detail_page.dart'
    as _i12;
import 'package:easy_smi/src/presentation/formations/certifications/my_certifications_page.dart'
    as _i28;
import 'package:easy_smi/src/presentation/formations/formation_detail_page.dart'
    as _i16;
import 'package:easy_smi/src/presentation/formations/formation_display_page.dart'
    as _i17;
import 'package:easy_smi/src/presentation/formations/formations_sensibilizations_page.dart'
    as _i18;
import 'package:easy_smi/src/presentation/formations/quizz/quizz_page.dart'
    as _i42;
import 'package:easy_smi/src/presentation/formations/quizz/quizz_responses_page.dart'
    as _i43;
import 'package:easy_smi/src/presentation/formations/quizz/quizz_responses_stats.dart'
    as _i44;
import 'package:easy_smi/src/presentation/formations/sensibilization_detail_page.dart'
    as _i47;
import 'package:easy_smi/src/presentation/home/home.dart' as _i19;
import 'package:easy_smi/src/presentation/inspections/inspection_recent_detail_page.dart'
    as _i22;
import 'package:easy_smi/src/presentation/inspections/inspection_result_page.dart'
    as _i23;
import 'package:easy_smi/src/presentation/inspections/inspection_result_saving_page.dart'
    as _i24;
import 'package:easy_smi/src/presentation/inspections/inspection_section_page.dart'
    as _i25;
import 'package:easy_smi/src/presentation/inspections/inspections_page.dart'
    as _i26;
import 'package:easy_smi/src/presentation/inspections/start_inspection_detail_page.dart'
    as _i50;
import 'package:easy_smi/src/presentation/inspections/start_inspection_page.dart'
    as _i51;
import 'package:easy_smi/src/presentation/onboarding/onboarding_page.dart'
    as _i30;
import 'package:easy_smi/src/presentation/permis/add_hot_permis_page.dart'
    as _i3;
import 'package:easy_smi/src/presentation/permis/hot_permis_detail_page.dart'
    as _i20;
import 'package:easy_smi/src/presentation/permis/hot_permis_page.dart' as _i21;
import 'package:easy_smi/src/presentation/permis/risk_assessment_page.dart'
    as _i45;
import 'package:easy_smi/src/presentation/permis/risk_assessment_result_page.dart'
    as _i46;
import 'package:easy_smi/src/presentation/profile/degree/profile_degree_page.dart'
    as _i32;
import 'package:easy_smi/src/presentation/profile/degree/profile_search_degree_page.dart'
    as _i36;
import 'package:easy_smi/src/presentation/profile/entretien/profile_entretien_page.dart'
    as _i33;
import 'package:easy_smi/src/presentation/profile/entretien/profile_search_entretien_page.dart'
    as _i37;
import 'package:easy_smi/src/presentation/profile/formation/profile_formation_page.dart'
    as _i34;
import 'package:easy_smi/src/presentation/profile/formation/profile_search_formation_page.dart'
    as _i38;
import 'package:easy_smi/src/presentation/profile/profile_page.dart' as _i35;
import 'package:easy_smi/src/presentation/profile/sensibilisation/profile_search_sensibilization_page.dart'
    as _i39;
import 'package:easy_smi/src/presentation/profile/sensibilisation/profile_sensibilization_page.dart'
    as _i40;
import 'package:easy_smi/src/presentation/splash/splash.dart' as _i49;
import 'package:flutter/foundation.dart' as _i56;
import 'package:flutter/material.dart' as _i53;
import 'package:flutter/widgets.dart' as _i59;

/// generated route for
/// [_i1.ActionDetailPage]
class ActionDetailRoute extends _i52.PageRouteInfo<ActionDetailRouteArgs> {
  ActionDetailRoute({
    _i53.Key? key,
    required _i54.ActionItem action,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         ActionDetailRoute.name,
         args: ActionDetailRouteArgs(key: key, action: action),
         initialChildren: children,
       );

  static const String name = 'ActionDetailRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActionDetailRouteArgs>();
      return _i1.ActionDetailPage(key: args.key, action: args.action);
    },
  );
}

class ActionDetailRouteArgs {
  const ActionDetailRouteArgs({this.key, required this.action});

  final _i53.Key? key;

  final _i54.ActionItem action;

  @override
  String toString() {
    return 'ActionDetailRouteArgs{key: $key, action: $action}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ActionDetailRouteArgs) return false;
    return key == other.key && action == other.action;
  }

  @override
  int get hashCode => key.hashCode ^ action.hashCode;
}

/// generated route for
/// [_i2.ActionsPage]
class ActionsRoute extends _i52.PageRouteInfo<void> {
  const ActionsRoute({List<_i52.PageRouteInfo>? children})
    : super(ActionsRoute.name, initialChildren: children);

  static const String name = 'ActionsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i2.ActionsPage();
    },
  );
}

/// generated route for
/// [_i3.AddHotPermisPage]
class AddHotPermisRoute extends _i52.PageRouteInfo<void> {
  const AddHotPermisRoute({List<_i52.PageRouteInfo>? children})
    : super(AddHotPermisRoute.name, initialChildren: children);

  static const String name = 'AddHotPermisRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i3.AddHotPermisPage();
    },
  );
}

/// generated route for
/// [_i4.AddNewBadEventsPage]
class AddNewBadEventsRoute extends _i52.PageRouteInfo<void> {
  const AddNewBadEventsRoute({List<_i52.PageRouteInfo>? children})
    : super(AddNewBadEventsRoute.name, initialChildren: children);

  static const String name = 'AddNewBadEventsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i4.AddNewBadEventsPage();
    },
  );
}

/// generated route for
/// [_i5.AllCertificationsPage]
class AllCertificationsRoute extends _i52.PageRouteInfo<void> {
  const AllCertificationsRoute({List<_i52.PageRouteInfo>? children})
    : super(AllCertificationsRoute.name, initialChildren: children);

  static const String name = 'AllCertificationsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i5.AllCertificationsPage();
    },
  );
}

/// generated route for
/// [_i6.AuditControlObjectifPage]
class AuditControlObjectifRoute extends _i52.PageRouteInfo<void> {
  const AuditControlObjectifRoute({List<_i52.PageRouteInfo>? children})
    : super(AuditControlObjectifRoute.name, initialChildren: children);

  static const String name = 'AuditControlObjectifRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i6.AuditControlObjectifPage();
    },
  );
}

/// generated route for
/// [_i7.AuditDetailPage]
class AuditDetailRoute extends _i52.PageRouteInfo<AuditDetailRouteArgs> {
  AuditDetailRoute({
    _i53.Key? key,
    required _i55.AuditItem audit,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         AuditDetailRoute.name,
         args: AuditDetailRouteArgs(key: key, audit: audit),
         initialChildren: children,
       );

  static const String name = 'AuditDetailRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuditDetailRouteArgs>();
      return _i7.AuditDetailPage(key: args.key, audit: args.audit);
    },
  );
}

class AuditDetailRouteArgs {
  const AuditDetailRouteArgs({this.key, required this.audit});

  final _i53.Key? key;

  final _i55.AuditItem audit;

  @override
  String toString() {
    return 'AuditDetailRouteArgs{key: $key, audit: $audit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuditDetailRouteArgs) return false;
    return key == other.key && audit == other.audit;
  }

  @override
  int get hashCode => key.hashCode ^ audit.hashCode;
}

/// generated route for
/// [_i8.AuditMakeConstatPage]
class AuditMakeConstatRoute extends _i52.PageRouteInfo<void> {
  const AuditMakeConstatRoute({List<_i52.PageRouteInfo>? children})
    : super(AuditMakeConstatRoute.name, initialChildren: children);

  static const String name = 'AuditMakeConstatRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i8.AuditMakeConstatPage();
    },
  );
}

/// generated route for
/// [_i9.AuditsPage]
class AuditsRoute extends _i52.PageRouteInfo<void> {
  const AuditsRoute({List<_i52.PageRouteInfo>? children})
    : super(AuditsRoute.name, initialChildren: children);

  static const String name = 'AuditsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i9.AuditsPage();
    },
  );
}

/// generated route for
/// [_i10.AuthWebViewPage]
class AuthWebViewRoute extends _i52.PageRouteInfo<AuthWebViewRouteArgs> {
  AuthWebViewRoute({
    _i53.Key? key,
    required String initialUrl,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         AuthWebViewRoute.name,
         args: AuthWebViewRouteArgs(key: key, initialUrl: initialUrl),
         initialChildren: children,
       );

  static const String name = 'AuthWebViewRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthWebViewRouteArgs>();
      return _i10.AuthWebViewPage(key: args.key, initialUrl: args.initialUrl);
    },
  );
}

class AuthWebViewRouteArgs {
  const AuthWebViewRouteArgs({this.key, required this.initialUrl});

  final _i53.Key? key;

  final String initialUrl;

  @override
  String toString() {
    return 'AuthWebViewRouteArgs{key: $key, initialUrl: $initialUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthWebViewRouteArgs) return false;
    return key == other.key && initialUrl == other.initialUrl;
  }

  @override
  int get hashCode => key.hashCode ^ initialUrl.hashCode;
}

/// generated route for
/// [_i11.BadEventsDetailPage]
class BadEventsDetailRoute extends _i52.PageRouteInfo<void> {
  const BadEventsDetailRoute({List<_i52.PageRouteInfo>? children})
    : super(BadEventsDetailRoute.name, initialChildren: children);

  static const String name = 'BadEventsDetailRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i11.BadEventsDetailPage();
    },
  );
}

/// generated route for
/// [_i12.CertificationDetailPage]
class CertificationDetailRoute extends _i52.PageRouteInfo<void> {
  const CertificationDetailRoute({List<_i52.PageRouteInfo>? children})
    : super(CertificationDetailRoute.name, initialChildren: children);

  static const String name = 'CertificationDetailRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i12.CertificationDetailPage();
    },
  );
}

/// generated route for
/// [_i13.CommentsPage]
class CommentsRoute extends _i52.PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    _i53.Key? key,
    required String commentableType,
    required dynamic commentableId,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         CommentsRoute.name,
         args: CommentsRouteArgs(
           key: key,
           commentableType: commentableType,
           commentableId: commentableId,
         ),
         initialChildren: children,
       );

  static const String name = 'CommentsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentsRouteArgs>();
      return _i13.CommentsPage(
        key: args.key,
        commentableType: args.commentableType,
        commentableId: args.commentableId,
      );
    },
  );
}

class CommentsRouteArgs {
  const CommentsRouteArgs({
    this.key,
    required this.commentableType,
    required this.commentableId,
  });

  final _i53.Key? key;

  final String commentableType;

  final dynamic commentableId;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, commentableType: $commentableType, commentableId: $commentableId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CommentsRouteArgs) return false;
    return key == other.key &&
        commentableType == other.commentableType &&
        commentableId == other.commentableId;
  }

  @override
  int get hashCode =>
      key.hashCode ^ commentableType.hashCode ^ commentableId.hashCode;
}

/// generated route for
/// [_i14.DeclarateEventPage]
class DeclarateEventRoute extends _i52.PageRouteInfo<void> {
  const DeclarateEventRoute({List<_i52.PageRouteInfo>? children})
    : super(DeclarateEventRoute.name, initialChildren: children);

  static const String name = 'DeclarateEventRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i14.DeclarateEventPage();
    },
  );
}

/// generated route for
/// [_i15.FilePreviewPage]
class FilePreviewRoute extends _i52.PageRouteInfo<FilePreviewRouteArgs> {
  FilePreviewRoute({
    _i56.Key? key,
    required String path,
    String? fileName,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         FilePreviewRoute.name,
         args: FilePreviewRouteArgs(key: key, path: path, fileName: fileName),
         initialChildren: children,
       );

  static const String name = 'FilePreviewRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FilePreviewRouteArgs>();
      return _i15.FilePreviewPage(
        key: args.key,
        path: args.path,
        fileName: args.fileName,
      );
    },
  );
}

class FilePreviewRouteArgs {
  const FilePreviewRouteArgs({this.key, required this.path, this.fileName});

  final _i56.Key? key;

  final String path;

  final String? fileName;

  @override
  String toString() {
    return 'FilePreviewRouteArgs{key: $key, path: $path, fileName: $fileName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FilePreviewRouteArgs) return false;
    return key == other.key && path == other.path && fileName == other.fileName;
  }

  @override
  int get hashCode => key.hashCode ^ path.hashCode ^ fileName.hashCode;
}

/// generated route for
/// [_i16.FormationDetailPage]
class FormationDetailRoute extends _i52.PageRouteInfo<void> {
  const FormationDetailRoute({List<_i52.PageRouteInfo>? children})
    : super(FormationDetailRoute.name, initialChildren: children);

  static const String name = 'FormationDetailRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i16.FormationDetailPage();
    },
  );
}

/// generated route for
/// [_i17.FormationDisplayPage]
class FormationDisplayRoute extends _i52.PageRouteInfo<void> {
  const FormationDisplayRoute({List<_i52.PageRouteInfo>? children})
    : super(FormationDisplayRoute.name, initialChildren: children);

  static const String name = 'FormationDisplayRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i17.FormationDisplayPage();
    },
  );
}

/// generated route for
/// [_i18.FormationsSensibilizationsPage]
class FormationsSensibilizationsRoute
    extends _i52.PageRouteInfo<FormationsSensibilizationsRouteArgs> {
  FormationsSensibilizationsRoute({
    _i53.Key? key,
    int initialPage = 2,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         FormationsSensibilizationsRoute.name,
         args: FormationsSensibilizationsRouteArgs(
           key: key,
           initialPage: initialPage,
         ),
         initialChildren: children,
       );

  static const String name = 'FormationsSensibilizationsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FormationsSensibilizationsRouteArgs>(
        orElse: () => const FormationsSensibilizationsRouteArgs(),
      );
      return _i18.FormationsSensibilizationsPage(
        key: args.key,
        initialPage: args.initialPage,
      );
    },
  );
}

class FormationsSensibilizationsRouteArgs {
  const FormationsSensibilizationsRouteArgs({this.key, this.initialPage = 2});

  final _i53.Key? key;

  final int initialPage;

  @override
  String toString() {
    return 'FormationsSensibilizationsRouteArgs{key: $key, initialPage: $initialPage}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FormationsSensibilizationsRouteArgs) return false;
    return key == other.key && initialPage == other.initialPage;
  }

  @override
  int get hashCode => key.hashCode ^ initialPage.hashCode;
}

/// generated route for
/// [_i19.HomePage]
class HomeRoute extends _i52.PageRouteInfo<void> {
  const HomeRoute({List<_i52.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i19.HomePage();
    },
  );
}

/// generated route for
/// [_i20.HotPermisDetailPage]
class HotPermisDetailRoute
    extends _i52.PageRouteInfo<HotPermisDetailRouteArgs> {
  HotPermisDetailRoute({
    _i53.Key? key,
    required _i57.PermitItem permit,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         HotPermisDetailRoute.name,
         args: HotPermisDetailRouteArgs(key: key, permit: permit),
         initialChildren: children,
       );

  static const String name = 'HotPermisDetailRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HotPermisDetailRouteArgs>();
      return _i20.HotPermisDetailPage(key: args.key, permit: args.permit);
    },
  );
}

class HotPermisDetailRouteArgs {
  const HotPermisDetailRouteArgs({this.key, required this.permit});

  final _i53.Key? key;

  final _i57.PermitItem permit;

  @override
  String toString() {
    return 'HotPermisDetailRouteArgs{key: $key, permit: $permit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HotPermisDetailRouteArgs) return false;
    return key == other.key && permit == other.permit;
  }

  @override
  int get hashCode => key.hashCode ^ permit.hashCode;
}

/// generated route for
/// [_i21.HotPermisPage]
class HotPermisRoute extends _i52.PageRouteInfo<void> {
  const HotPermisRoute({List<_i52.PageRouteInfo>? children})
    : super(HotPermisRoute.name, initialChildren: children);

  static const String name = 'HotPermisRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i21.HotPermisPage();
    },
  );
}

/// generated route for
/// [_i22.InpectionRecentDetailPage]
class InpectionRecentDetailRoute
    extends _i52.PageRouteInfo<InpectionRecentDetailRouteArgs> {
  InpectionRecentDetailRoute({
    _i53.Key? key,
    required _i58.InspectionFormItem item,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         InpectionRecentDetailRoute.name,
         args: InpectionRecentDetailRouteArgs(key: key, item: item),
         initialChildren: children,
       );

  static const String name = 'InpectionRecentDetailRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InpectionRecentDetailRouteArgs>();
      return _i22.InpectionRecentDetailPage(key: args.key, item: args.item);
    },
  );
}

class InpectionRecentDetailRouteArgs {
  const InpectionRecentDetailRouteArgs({this.key, required this.item});

  final _i53.Key? key;

  final _i58.InspectionFormItem item;

  @override
  String toString() {
    return 'InpectionRecentDetailRouteArgs{key: $key, item: $item}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InpectionRecentDetailRouteArgs) return false;
    return key == other.key && item == other.item;
  }

  @override
  int get hashCode => key.hashCode ^ item.hashCode;
}

/// generated route for
/// [_i23.InspectionResultPage]
class InspectionResultRoute extends _i52.PageRouteInfo<void> {
  const InspectionResultRoute({List<_i52.PageRouteInfo>? children})
    : super(InspectionResultRoute.name, initialChildren: children);

  static const String name = 'InspectionResultRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i23.InspectionResultPage();
    },
  );
}

/// generated route for
/// [_i24.InspectionResultSavingPage]
class InspectionResultSavingRoute extends _i52.PageRouteInfo<void> {
  const InspectionResultSavingRoute({List<_i52.PageRouteInfo>? children})
    : super(InspectionResultSavingRoute.name, initialChildren: children);

  static const String name = 'InspectionResultSavingRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i24.InspectionResultSavingPage();
    },
  );
}

/// generated route for
/// [_i25.InspectionSectionPage]
class InspectionSectionRoute extends _i52.PageRouteInfo<void> {
  const InspectionSectionRoute({List<_i52.PageRouteInfo>? children})
    : super(InspectionSectionRoute.name, initialChildren: children);

  static const String name = 'InspectionSectionRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i25.InspectionSectionPage();
    },
  );
}

/// generated route for
/// [_i26.InspectionsPage]
class InspectionsRoute extends _i52.PageRouteInfo<void> {
  const InspectionsRoute({List<_i52.PageRouteInfo>? children})
    : super(InspectionsRoute.name, initialChildren: children);

  static const String name = 'InspectionsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i26.InspectionsPage();
    },
  );
}

/// generated route for
/// [_i27.JoinOrganisationPage]
class JoinOrganisationRoute extends _i52.PageRouteInfo<void> {
  const JoinOrganisationRoute({List<_i52.PageRouteInfo>? children})
    : super(JoinOrganisationRoute.name, initialChildren: children);

  static const String name = 'JoinOrganisationRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i27.JoinOrganisationPage();
    },
  );
}

/// generated route for
/// [_i28.MyCertificationsPage]
class MyCertificationsRoute extends _i52.PageRouteInfo<void> {
  const MyCertificationsRoute({List<_i52.PageRouteInfo>? children})
    : super(MyCertificationsRoute.name, initialChildren: children);

  static const String name = 'MyCertificationsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i28.MyCertificationsPage();
    },
  );
}

/// generated route for
/// [_i29.NewBadEventsPage]
class NewBadEventsRoute extends _i52.PageRouteInfo<void> {
  const NewBadEventsRoute({List<_i52.PageRouteInfo>? children})
    : super(NewBadEventsRoute.name, initialChildren: children);

  static const String name = 'NewBadEventsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i29.NewBadEventsPage();
    },
  );
}

/// generated route for
/// [_i30.OnboardingPage]
class OnboardingRoute extends _i52.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i53.Key? key,
    _i53.VoidCallback? onFinish,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         OnboardingRoute.name,
         args: OnboardingRouteArgs(key: key, onFinish: onFinish),
         initialChildren: children,
       );

  static const String name = 'OnboardingRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>(
        orElse: () => const OnboardingRouteArgs(),
      );
      return _i30.OnboardingPage(key: args.key, onFinish: args.onFinish);
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key, this.onFinish});

  final _i53.Key? key;

  final _i53.VoidCallback? onFinish;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key, onFinish: $onFinish}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingRouteArgs) return false;
    return key == other.key && onFinish == other.onFinish;
  }

  @override
  int get hashCode => key.hashCode ^ onFinish.hashCode;
}

/// generated route for
/// [_i31.PendingJoinOrganisationPage]
class PendingJoinOrganisationRoute extends _i52.PageRouteInfo<void> {
  const PendingJoinOrganisationRoute({List<_i52.PageRouteInfo>? children})
    : super(PendingJoinOrganisationRoute.name, initialChildren: children);

  static const String name = 'PendingJoinOrganisationRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i31.PendingJoinOrganisationPage();
    },
  );
}

/// generated route for
/// [_i32.ProfileDegreePage]
class ProfileDegreeRoute extends _i52.PageRouteInfo<void> {
  const ProfileDegreeRoute({List<_i52.PageRouteInfo>? children})
    : super(ProfileDegreeRoute.name, initialChildren: children);

  static const String name = 'ProfileDegreeRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i32.ProfileDegreePage();
    },
  );
}

/// generated route for
/// [_i33.ProfileEntretienPage]
class ProfileEntretienRoute extends _i52.PageRouteInfo<void> {
  const ProfileEntretienRoute({List<_i52.PageRouteInfo>? children})
    : super(ProfileEntretienRoute.name, initialChildren: children);

  static const String name = 'ProfileEntretienRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i33.ProfileEntretienPage();
    },
  );
}

/// generated route for
/// [_i34.ProfileFormationPage]
class ProfileFormationRoute extends _i52.PageRouteInfo<void> {
  const ProfileFormationRoute({List<_i52.PageRouteInfo>? children})
    : super(ProfileFormationRoute.name, initialChildren: children);

  static const String name = 'ProfileFormationRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i34.ProfileFormationPage();
    },
  );
}

/// generated route for
/// [_i35.ProfilePage]
class ProfileRoute extends _i52.PageRouteInfo<void> {
  const ProfileRoute({List<_i52.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i35.ProfilePage();
    },
  );
}

/// generated route for
/// [_i36.ProfileSearchDegreePage]
class ProfileSearchDegreeRoute extends _i52.PageRouteInfo<void> {
  const ProfileSearchDegreeRoute({List<_i52.PageRouteInfo>? children})
    : super(ProfileSearchDegreeRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchDegreeRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i36.ProfileSearchDegreePage();
    },
  );
}

/// generated route for
/// [_i37.ProfileSearchEntretienPage]
class ProfileSearchEntretienRoute extends _i52.PageRouteInfo<void> {
  const ProfileSearchEntretienRoute({List<_i52.PageRouteInfo>? children})
    : super(ProfileSearchEntretienRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchEntretienRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i37.ProfileSearchEntretienPage();
    },
  );
}

/// generated route for
/// [_i38.ProfileSearchFormationPage]
class ProfileSearchFormationRoute extends _i52.PageRouteInfo<void> {
  const ProfileSearchFormationRoute({List<_i52.PageRouteInfo>? children})
    : super(ProfileSearchFormationRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchFormationRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i38.ProfileSearchFormationPage();
    },
  );
}

/// generated route for
/// [_i39.ProfileSearchSensibilizationPage]
class ProfileSearchSensibilizationRoute extends _i52.PageRouteInfo<void> {
  const ProfileSearchSensibilizationRoute({List<_i52.PageRouteInfo>? children})
    : super(ProfileSearchSensibilizationRoute.name, initialChildren: children);

  static const String name = 'ProfileSearchSensibilizationRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i39.ProfileSearchSensibilizationPage();
    },
  );
}

/// generated route for
/// [_i40.ProfileSensibilizationPage]
class ProfileSensibilizationRoute extends _i52.PageRouteInfo<void> {
  const ProfileSensibilizationRoute({List<_i52.PageRouteInfo>? children})
    : super(ProfileSensibilizationRoute.name, initialChildren: children);

  static const String name = 'ProfileSensibilizationRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i40.ProfileSensibilizationPage();
    },
  );
}

/// generated route for
/// [_i41.ProgrammAuditPage]
class ProgrammAuditRoute extends _i52.PageRouteInfo<void> {
  const ProgrammAuditRoute({List<_i52.PageRouteInfo>? children})
    : super(ProgrammAuditRoute.name, initialChildren: children);

  static const String name = 'ProgrammAuditRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i41.ProgrammAuditPage();
    },
  );
}

/// generated route for
/// [_i42.QuizzPage]
class QuizzRoute extends _i52.PageRouteInfo<void> {
  const QuizzRoute({List<_i52.PageRouteInfo>? children})
    : super(QuizzRoute.name, initialChildren: children);

  static const String name = 'QuizzRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i42.QuizzPage();
    },
  );
}

/// generated route for
/// [_i43.QuizzResponsesPage]
class QuizzResponsesRoute extends _i52.PageRouteInfo<void> {
  const QuizzResponsesRoute({List<_i52.PageRouteInfo>? children})
    : super(QuizzResponsesRoute.name, initialChildren: children);

  static const String name = 'QuizzResponsesRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i43.QuizzResponsesPage();
    },
  );
}

/// generated route for
/// [_i44.QuizzResponsesStatsPage]
class QuizzResponsesStatsRoute extends _i52.PageRouteInfo<void> {
  const QuizzResponsesStatsRoute({List<_i52.PageRouteInfo>? children})
    : super(QuizzResponsesStatsRoute.name, initialChildren: children);

  static const String name = 'QuizzResponsesStatsRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i44.QuizzResponsesStatsPage();
    },
  );
}

/// generated route for
/// [_i45.RiskAssessmentPage]
class RiskAssessmentRoute extends _i52.PageRouteInfo<RiskAssessmentRouteArgs> {
  RiskAssessmentRoute({
    _i59.Key? key,
    required _i57.PermitItem permit,
    List<_i60.PermitRiskAssessmentQuestionInput>? initialAnswers,
    int? initialIndex,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         RiskAssessmentRoute.name,
         args: RiskAssessmentRouteArgs(
           key: key,
           permit: permit,
           initialAnswers: initialAnswers,
           initialIndex: initialIndex,
         ),
         initialChildren: children,
       );

  static const String name = 'RiskAssessmentRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RiskAssessmentRouteArgs>();
      return _i45.RiskAssessmentPage(
        key: args.key,
        permit: args.permit,
        initialAnswers: args.initialAnswers,
        initialIndex: args.initialIndex,
      );
    },
  );
}

class RiskAssessmentRouteArgs {
  const RiskAssessmentRouteArgs({
    this.key,
    required this.permit,
    this.initialAnswers,
    this.initialIndex,
  });

  final _i59.Key? key;

  final _i57.PermitItem permit;

  final List<_i60.PermitRiskAssessmentQuestionInput>? initialAnswers;

  final int? initialIndex;

  @override
  String toString() {
    return 'RiskAssessmentRouteArgs{key: $key, permit: $permit, initialAnswers: $initialAnswers, initialIndex: $initialIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RiskAssessmentRouteArgs) return false;
    return key == other.key &&
        permit == other.permit &&
        const _i61.ListEquality().equals(
          initialAnswers,
          other.initialAnswers,
        ) &&
        initialIndex == other.initialIndex;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      permit.hashCode ^
      const _i61.ListEquality().hash(initialAnswers) ^
      initialIndex.hashCode;
}

/// generated route for
/// [_i46.RiskAssessmentResultPage]
class RiskAssessmentResultRoute
    extends _i52.PageRouteInfo<RiskAssessmentResultRouteArgs> {
  RiskAssessmentResultRoute({
    _i53.Key? key,
    required List<_i60.PermitRiskAssessmentQuestionInput> responses,
    required _i57.PermitItem permit,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         RiskAssessmentResultRoute.name,
         args: RiskAssessmentResultRouteArgs(
           key: key,
           responses: responses,
           permit: permit,
         ),
         initialChildren: children,
       );

  static const String name = 'RiskAssessmentResultRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RiskAssessmentResultRouteArgs>();
      return _i46.RiskAssessmentResultPage(
        key: args.key,
        responses: args.responses,
        permit: args.permit,
      );
    },
  );
}

class RiskAssessmentResultRouteArgs {
  const RiskAssessmentResultRouteArgs({
    this.key,
    required this.responses,
    required this.permit,
  });

  final _i53.Key? key;

  final List<_i60.PermitRiskAssessmentQuestionInput> responses;

  final _i57.PermitItem permit;

  @override
  String toString() {
    return 'RiskAssessmentResultRouteArgs{key: $key, responses: $responses, permit: $permit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RiskAssessmentResultRouteArgs) return false;
    return key == other.key &&
        const _i61.ListEquality().equals(responses, other.responses) &&
        permit == other.permit;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i61.ListEquality().hash(responses) ^
      permit.hashCode;
}

/// generated route for
/// [_i47.SensibilizationDetailPage]
class SensibilizationDetailRoute extends _i52.PageRouteInfo<void> {
  const SensibilizationDetailRoute({List<_i52.PageRouteInfo>? children})
    : super(SensibilizationDetailRoute.name, initialChildren: children);

  static const String name = 'SensibilizationDetailRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i47.SensibilizationDetailPage();
    },
  );
}

/// generated route for
/// [_i48.SignInPage]
class SignInRoute extends _i52.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i53.Key? key,
    required String email,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>();
      return _i48.SignInPage(key: args.key, email: args.email);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, required this.email});

  final _i53.Key? key;

  final String email;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}

/// generated route for
/// [_i49.SplashPage]
class SplashRoute extends _i52.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i53.Key? key,
    bool? withDeepLink,
    bool? fromLogout,
    List<_i52.PageRouteInfo>? children,
  }) : super(
         SplashRoute.name,
         args: SplashRouteArgs(
           key: key,
           withDeepLink: withDeepLink,
           fromLogout: fromLogout,
         ),
         initialChildren: children,
       );

  static const String name = 'SplashRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashRouteArgs>(
        orElse: () => const SplashRouteArgs(),
      );
      return _i49.SplashPage(
        key: args.key,
        withDeepLink: args.withDeepLink,
        fromLogout: args.fromLogout,
      );
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key, this.withDeepLink, this.fromLogout});

  final _i53.Key? key;

  final bool? withDeepLink;

  final bool? fromLogout;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, withDeepLink: $withDeepLink, fromLogout: $fromLogout}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SplashRouteArgs) return false;
    return key == other.key &&
        withDeepLink == other.withDeepLink &&
        fromLogout == other.fromLogout;
  }

  @override
  int get hashCode =>
      key.hashCode ^ withDeepLink.hashCode ^ fromLogout.hashCode;
}

/// generated route for
/// [_i50.StartInspectionDetailPage]
class StartInspectionDetailRoute extends _i52.PageRouteInfo<void> {
  const StartInspectionDetailRoute({List<_i52.PageRouteInfo>? children})
    : super(StartInspectionDetailRoute.name, initialChildren: children);

  static const String name = 'StartInspectionDetailRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i50.StartInspectionDetailPage();
    },
  );
}

/// generated route for
/// [_i51.StartInspectionPage]
class StartInspectionRoute extends _i52.PageRouteInfo<void> {
  const StartInspectionRoute({List<_i52.PageRouteInfo>? children})
    : super(StartInspectionRoute.name, initialChildren: children);

  static const String name = 'StartInspectionRoute';

  static _i52.PageInfo page = _i52.PageInfo(
    name,
    builder: (data) {
      return const _i51.StartInspectionPage();
    },
  );
}
