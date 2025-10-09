import 'package:flutter/material.dart';

String humanizeGeneralConclusion(String generalConclusion) {
  switch (generalConclusion.toLowerCase()) {
    case 'conform':
      return 'Conforme';
    case 'non_conform':
      return 'Non Conforme';
    case 'not_applicable':
      return 'Non Applicable';
    default:
      return generalConclusion;
  }
}

Color getConclusionColor(String generalConclusion) {
  switch (generalConclusion.toLowerCase()) {
    case 'conform':
      return Colors.green;
    case 'non_conform':
      return Colors.red;
    case 'not_applicable':
      return Colors.grey;
    default:
      return Colors.black;
  }
}

class AuditConclusion {
  final String? generalConclusion;
  final String? generalReportPath;

  AuditConclusion({
    required this.generalConclusion,
    required this.generalReportPath,
  });

  factory AuditConclusion.fromJson(Map<String, dynamic> json) =>
      AuditConclusion(
        generalConclusion: json['general_conclusion'] as String?,
        generalReportPath: json['general_report_path'] as String?,
      );

  String get safeGeneralConclusion => generalConclusion ?? '';
  String get safeGeneralReportPath => generalReportPath ?? '';

  String get humanizedGeneralConclusion =>
      (safeGeneralConclusion.isNotEmpty
              ? humanizeGeneralConclusion(safeGeneralConclusion)
              : '')
          .toUpperCase();

  Color get statutColor => getConclusionColor(safeGeneralConclusion);
}
