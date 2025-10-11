import 'communication_action_plan.dart';

class CampaignItem {
  final int id;
  final String title;
  final String? coverImage;
  final String? description;
  final String? message;
  final String? startDate;
  final String? endDate;
  final String? readReceipt;
  final String? communicationType;
  final String? smartObjective;
  final int? targetsCount;
  final int? mediaCount;
  final int? engagedTargetsCount;
  final num? engagementRate;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final List<CommunicationActionPlan> actionPlans;

  CampaignItem({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.description,
    required this.message,
    required this.startDate,
    required this.endDate,
    required this.readReceipt,
    required this.communicationType,
    required this.smartObjective,
    required this.targetsCount,
    required this.mediaCount,
    required this.engagedTargetsCount,
    required this.engagementRate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.actionPlans,
  });

  factory CampaignItem.fromJson(Map<String, dynamic> json) {
    final List<dynamic> rawPlans =
        (json['communication_action_plans'] as List<dynamic>?) ??
        (json['action_plans'] as List<dynamic>?) ??
        const [];
    return CampaignItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: (json['title'] as String?) ?? (json['name'] as String?) ?? '',
      coverImage:
          (json['cover_image'] as String?) ?? (json['coverImage'] as String?),
      description: json['description'] as String?,
      message: json['message'] as String?,
      startDate:
          (json['start_date'] as String?) ?? (json['startDate'] as String?),
      endDate: (json['end_date'] as String?) ?? (json['endDate'] as String?),
      readReceipt:
          (json['read_receipt'] as String?) ?? (json['readReceipt'] as String?),
      communicationType:
          (json['communication_type'] as String?) ??
          (json['communicationType'] as String?),
      smartObjective:
          (json['smart_objective'] as String?) ??
          (json['smartObjective'] as String?),
      targetsCount:
          (json['targets_count'] as num?)?.toInt() ??
          (json['targetsCount'] as num?)?.toInt(),
      mediaCount:
          (json['media_count'] as num?)?.toInt() ??
          (json['mediaCount'] as num?)?.toInt(),
      engagedTargetsCount:
          (json['engaged_targets_count'] as num?)?.toInt() ??
          (json['engagedTargetsCount'] as num?)?.toInt(),
      engagementRate:
          (json['engagement_rate'] as num?) ?? (json['engagementRate'] as num?),
      status: json['status'] as String?,
      createdAt:
          (json['created_at'] as String?) ?? (json['createdAt'] as String?),
      updatedAt:
          (json['updated_at'] as String?) ?? (json['updatedAt'] as String?),
      actionPlans: rawPlans
          .whereType<Map<String, dynamic>>()
          .map(CommunicationActionPlan.fromJson)
          .toList(),
    );
  }
}
