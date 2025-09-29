import 'action_item.dart';

class ActionTask {
  final int id;
  final int actionId;
  final String? title;
  final String? description;
  final String? status;
  final String? startDate;
  final String? endDate;
  final int? inChargeId;
  final String? document;
  final String? createdAt;
  final String? updatedAt;
  final String? inChargeName;
  final List<dynamic> aspectsToCheck;
  final ActionItem? action; // Nested summary of the parent action if provided

  const ActionTask({
    required this.id,
    required this.actionId,
    this.title,
    this.description,
    this.status,
    this.startDate,
    this.endDate,
    this.inChargeId,
    this.document,
    this.createdAt,
    this.updatedAt,
    this.inChargeName,
    this.aspectsToCheck = const [],
    this.action,
  });

  factory ActionTask.fromJson(Map<String, dynamic> json) {
    return ActionTask(
      id: (json['id'] as num).toInt(),
      actionId: (json['action_id'] as num).toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      inChargeId: (json['in_charge_id'] as num?)?.toInt(),
      document: json['document'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      inChargeName: json['in_charge_name'] as String?,
      aspectsToCheck: (json['aspects_to_check'] as List<dynamic>?) ?? const [],
      action: json['action'] is Map<String, dynamic>
          ? ActionItem.fromJson(json['action'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'action_id': actionId,
    'title': title,
    'description': description,
    'status': status,
    'start_date': startDate,
    'end_date': endDate,
    'in_charge_id': inChargeId,
    'document': document,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'in_charge_name': inChargeName,
    'aspects_to_check': aspectsToCheck,
    'action': action?.toJson(),
  };

  bool get isInProgress => status == 'inProgress';
  bool get isLate {
    if (endDate == null) return false;
    final end = DateTime.tryParse(endDate!);
    if (end == null) return false;
    final now = DateTime.now();
    return now.isAfter(end) && status == 'inProgress';
  }

  bool get isDue => status == 'inProgress' && endDate != null;

  bool get crossed => status == 'completed';

  String get dueLabel {
    if (endDate == null) return 'Aucune date limite';
    final end = DateTime.tryParse(endDate!);
    if (end == null) return 'Date invalide';
    final now = DateTime.now();
    final difference = end.difference(now).inDays;

    if (difference > 1) {
      return 'Échéance dans $difference jours';
    } else if (difference == 1) {
      return 'Échéance demain';
    } else if (difference == 0) {
      return 'Échéance aujourd\'hui';
    } else {
      final overdueDays = -difference;
      return overdueDays == 1
          ? 'En retard d\'1 jour'
          : 'En retard de $overdueDays jours';
    }
  }

  bool hasFileAttachment() {
    return document != null && document!.isNotEmpty;
  }
}
