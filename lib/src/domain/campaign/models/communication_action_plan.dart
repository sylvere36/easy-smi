class CommunicationActionPlan {
  final int id;
  final int campaignId;
  final String? communicationMomentType;
  final String? startDate;
  final String? endDate;
  final String? communicator;
  final String? target;
  final List<String> communicationChannels;
  final String? createdAt;
  final String? updatedAt;

  CommunicationActionPlan({
    required this.id,
    required this.campaignId,
    required this.communicationMomentType,
    required this.startDate,
    required this.endDate,
    required this.communicator,
    required this.target,
    required this.communicationChannels,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommunicationActionPlan.fromJson(Map<String, dynamic> json) {
    return CommunicationActionPlan(
      id: (json['id'] as num?)?.toInt() ?? 0,
      campaignId:
          (json['campaign_id'] as num?)?.toInt() ??
          (json['campaignId'] as num?)?.toInt() ??
          0,
      communicationMomentType:
          (json['communication_moment_type'] as String?) ??
          (json['communicationMomentType'] as String?),
      startDate:
          (json['start_date'] as String?) ?? (json['startDate'] as String?),
      endDate: (json['end_date'] as String?) ?? (json['endDate'] as String?),
      communicator:
          (json['communicator'] as String?) ?? (json['actor'] as String?),
      target: json['target'] as String?,
      communicationChannels:
          (json['communication_channels'] as List<dynamic>?)
              ?.whereType<String>()
              .toList() ??
          const <String>[],
      createdAt:
          (json['created_at'] as String?) ?? (json['createdAt'] as String?),
      updatedAt:
          (json['updated_at'] as String?) ?? (json['updatedAt'] as String?),
    );
  }
}
