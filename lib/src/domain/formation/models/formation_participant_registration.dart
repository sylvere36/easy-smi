class FormationParticipantRegistration {
  final int id;
  final int formationId;
  final String registrationType;
  final String? justification;
  final String? trainingLocation;
  final String? startDate;
  final String? endDate;
  final String? cost; // keep raw string as provided
  final String? fundedBy;
  final String? occupationType;
  final String? revision;
  final String? version;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? printValue;
  final String? reference;
  final String status;
  final int? organizationId;
  final String? createdAt;
  final String? updatedAt;
  final int? participantId;
  final int? formationPlanId;

  FormationParticipantRegistration({
    required this.id,
    required this.formationId,
    required this.registrationType,
    this.justification,
    this.trainingLocation,
    this.startDate,
    this.endDate,
    this.cost,
    this.fundedBy,
    this.occupationType,
    this.revision,
    this.version,
    this.summary,
    this.object,
    this.partieRevisee,
    this.printValue,
    this.reference,
    required this.status,
    this.organizationId,
    this.createdAt,
    this.updatedAt,
    this.participantId,
    this.formationPlanId,
  });

  factory FormationParticipantRegistration.fromJson(
    Map<String, dynamic> json,
  ) => FormationParticipantRegistration(
    id: (json['id'] as num).toInt(),
    formationId: (json['formation_id'] as num?)?.toInt() ?? 0,
    registrationType: (json['registration_type'] as String?) ?? '',
    justification: json['justification'] as String?,
    trainingLocation: json['training_location'] as String?,
    startDate: json['start_date'] as String?,
    endDate: json['end_date'] as String?,
    cost: json['cost']?.toString(),
    fundedBy: json['funded_by'] as String?,
    occupationType: json['occupation_type'] as String?,
    revision: json['revision'] as String?,
    version: json['version'] as String?,
    summary: json['summary'] as String?,
    object: json['object'] as String?,
    partieRevisee: json['partie_revisee'] as String?,
    printValue: json['print']?.toString(),
    reference: json['reference'] as String?,
    status: (json['status'] as String?) ?? '',
    organizationId: (json['organization_id'] as num?)?.toInt(),
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    participantId: (json['participant_id'] as num?)?.toInt(),
    formationPlanId: (json['formation_plan_id'] as num?)?.toInt(),
  );
}
