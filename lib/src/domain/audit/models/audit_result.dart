import 'package:flutter/material.dart';

class AuditControlPoint {
  final String? title;
  final String? description;
  final String? reference;

  AuditControlPoint({this.title, this.description, this.reference});

  factory AuditControlPoint.fromJson(Map<String, dynamic> json) =>
      AuditControlPoint(
        title: json['title'] as String?,
        description: json['description'] as String?,
        reference: json['reference'] as String?,
      );
}

String humanizeStatus(String status) {
  switch (status.toLowerCase()) {
    case 'conform':
      return 'Conforme';
    case 'non_conform':
      return 'Non Conforme';
    case 'observation':
      return 'Observation';
    case 'not_applicable':
      return 'Non Applicable';
    default:
      return status;
  }
}

Color colorByStatus(String status) {
  switch (status.toLowerCase()) {
    case 'conform':
      return Colors.green;
    case 'non_conform':
      return Colors.red;
    case 'observation':
      return Colors.orange;
    case 'not_applicable':
      return Colors.grey;
    default:
      return Colors.blueGrey;
  }
}

class AuditResult {
  final int id;
  final String description;
  final String status;
  final String? commentId;
  final List<String> attachments;
  final AuditControlPoint? controlPoint;
  final String? createdAt;
  final String? updatedAt;

  AuditResult({
    required this.id,
    required this.description,
    required this.status,
    this.commentId,
    required this.attachments,
    this.controlPoint,
    this.createdAt,
    this.updatedAt,
  });

  factory AuditResult.fromJson(Map<String, dynamic> json) {
    // attachments may be list of strings or list of objects containing a path/url
    final rawAttachments = json['attachments'] as List<dynamic>? ?? [];
    final List<String> atts = rawAttachments.map((e) {
      if (e is String) return e;
      if (e is Map<String, dynamic>) {
        return (e['document_path'] as String?) ??
            (e['path'] as String?) ??
            (e['url'] as String?) ??
            e.toString();
      }
      return e.toString();
    }).toList();

    final ctrl = json['control_point'];
    return AuditResult(
      id: (json['id'] as num).toInt(),
      description: (json['description'] as String?) ?? '',
      status: (json['status'] as String?) ?? '',
      commentId: json['comment_id']?.toString(),
      attachments: atts,
      controlPoint: ctrl is Map<String, dynamic>
          ? AuditControlPoint.fromJson(ctrl)
          : null,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  String get humanizedStatus => humanizeStatus(status);

  Color get statutColor => colorByStatus(status);
}
