enum EvaluationType { inspection, audit, other }

enum EvaluationStatus { planified, done }

class EvaluationItem {
  final int id;
  final int eventFormId;
  final EvaluationType evaluationType;
  final String title;
  final String report;
  final DateTime plannedDate;
  final DateTime? realizedDate;
  final int responsibleId;
  final EvaluationStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const EvaluationItem({
    required this.id,
    required this.eventFormId,
    required this.evaluationType,
    required this.title,
    required this.report,
    required this.plannedDate,
    this.realizedDate,
    required this.responsibleId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EvaluationItem.fromJson(Map<String, dynamic> json) {
    return EvaluationItem(
      id: json['id'] as int,
      eventFormId: json['event_form_id'] as int,
      evaluationType: _mapType(json['evaluation_type'] as String),
      title: json['title'] as String,
      report: json['report'] as String,
      plannedDate: DateTime.parse(json['planned_date'] as String),
      realizedDate: json['realized_date'] != null
          ? DateTime.tryParse(json['realized_date'])
          : null,
      responsibleId: json['responsible_id'] as int,
      status: _mapStatus(json['status'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_form_id': eventFormId,
      'evaluation_type': evaluationType.name,
      'title': title,
      'report': report,
      'planned_date': plannedDate.toIso8601String(),
      'realized_date': realizedDate?.toIso8601String(),
      'responsible_id': responsibleId,
      'status': status.name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  static EvaluationType _mapType(String type) {
    switch (type) {
      case 'inspection':
        return EvaluationType.inspection;
      case 'audit':
        return EvaluationType.audit;
      case 'other':
        return EvaluationType.other;
      default:
        throw ArgumentError('Unknown evaluation_type: $type');
    }
  }

  static EvaluationStatus _mapStatus(String status) {
    switch (status) {
      case 'planified':
        return EvaluationStatus.planified;
      case 'done':
        return EvaluationStatus.done;
      default:
        throw ArgumentError('Unknown status: $status');
    }
  }

  String get humanType => _humanType(evaluationType);
  String get humanStatus => _humanStatus(status);
  String get toFenchDate => _toFrenchDate(plannedDate);
}

String _humanType(EvaluationType type) {
  switch (type) {
    case EvaluationType.inspection:
      return 'Inspection';
    case EvaluationType.audit:
      return 'Audit';
    case EvaluationType.other:
      return 'Autre';
  }
}

String _humanStatus(EvaluationStatus status) {
  switch (status) {
    case EvaluationStatus.done:
      return 'Réalisée';
    case EvaluationStatus.planified:
      return 'Planifiée';
  }
}

// DateTime to this french format : 23 mars 2024
String _toFrenchDate(DateTime date) {
  final months = [
    'janvier',
    'février',
    'mars',
    'avril',
    'mai',
    'juin',
    'juillet',
    'août',
    'septembre',
    'octobre',
    'novembre',
    'décembre'
  ];
  return '${date.day} ${months[date.month - 1]} ${date.year}';
}
