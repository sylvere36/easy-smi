class InspectionUser {
  final int id;
  final String name;
  final String email;
  final int? organizationId;
  final String? profile;

  InspectionUser({
    required this.id,
    required this.name,
    required this.email,
    this.organizationId,
    this.profile,
  });

  factory InspectionUser.fromJson(Map<String, dynamic> json) => InspectionUser(
    id: (json['id'] as num?)?.toInt() ?? 0,
    name: (json['name'] as String?) ?? '',
    email: (json['email'] as String?) ?? '',
    organizationId: (json['organization_id'] as num?)?.toInt(),
    profile: json['profile'] as String?,
  );
}

class InspectionSite {
  final int id;
  final int organizationId;
  final String label;

  InspectionSite({
    required this.id,
    required this.organizationId,
    required this.label,
  });

  factory InspectionSite.fromJson(Map<String, dynamic> json) => InspectionSite(
    id: (json['id'] as num?)?.toInt() ?? 0,
    organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
    label: (json['label'] as String?) ?? '',
  );
}

class InspectionQuestionLite {
  final int id;
  final int inspectionSectionId;
  final int order;
  final String label;
  final String questionType;
  final String? expectedAnswer;
  final String? explanationNote;

  InspectionQuestionLite({
    required this.id,
    required this.inspectionSectionId,
    required this.order,
    required this.label,
    required this.questionType,
    this.expectedAnswer,
    this.explanationNote,
  });

  factory InspectionQuestionLite.fromJson(Map<String, dynamic> json) =>
      InspectionQuestionLite(
        id: (json['id'] as num?)?.toInt() ?? 0,
        inspectionSectionId:
            (json['inspection_section_id'] as num?)?.toInt() ?? 0,
        order: (json['order'] as num?)?.toInt() ?? 0,
        label: (json['label'] as String?) ?? '',
        questionType: (json['question_type'] as String?) ?? '',
        expectedAnswer: json['expected_answer']?.toString(),
        explanationNote: json['explanation_note'] as String?,
      );

  // Helpers for question types
  bool get isBoolean => questionType.toLowerCase() == 'yes_no';
  bool get isBooleanWithNan => questionType.toLowerCase() == 'yes_no_na';
  bool get isMeasurement => questionType.toLowerCase() == 'measurement';
  // alias to match requested naming
  bool get isMeasurment => isMeasurement;
  bool get isDescription => questionType.toLowerCase() == 'description';

  /// Evaluate if a provided raw answer conforms to the expected_answer.
  ///
  /// Rules:
  /// - yes_no / yes_no_na: compare normalized strings ('yes'/'no'/'na').
  /// - measurement: parse numeric answer and evaluate all constraints in
  ///                expected_answer of the form "<4", ">= 3" joined with "et".
  /// - description: if expected_answer is empty -> true, else substring match.
  bool isConformeWith(String? rawAnswer) {
    final exp = (expectedAnswer ?? '').trim();
    final ans = (rawAnswer ?? '').trim();

    if (exp.isEmpty) {
      // No expectation -> considered conform
      return true;
    }

    if (isBoolean || isBooleanWithNan) {
      final norm = _normalizeYesNoNa(ans);
      final expNorm = _normalizeYesNoNa(exp);
      if (norm == null || expNorm == null) return false;
      return norm == expNorm;
    }

    if (isMeasurement) {
      final value = _toDouble(ans);
      if (value == null) return false;
      // Support expressions like "<4 et >3" or ">= 2 et <= 5"
      final clauses = exp
          .toLowerCase()
          .replaceAll(',', '.')
          .split(RegExp(r'\bet\b'))
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
      for (final c in clauses) {
        final ok = _evalNumericClause(value, c);
        if (!ok) return false;
      }
      return true;
    }

    if (isDescription) {
      // Simple contains check, case-insensitive
      return ans.toLowerCase().contains(exp.toLowerCase());
    }

    // Unknown type: fallback to equality
    return ans.toLowerCase() == exp.toLowerCase();
  }

  // Convenience wrapper using non-nullable signature as requested
  bool isConforme(String rawAnswer) => isConformeWith(rawAnswer);

  String? _normalizeYesNoNa(String s) {
    final v = s.trim().toLowerCase();
    if (v == 'yes' || v == 'oui' || v == 'o') return 'yes';
    if (v == 'no' || v == 'non' || v == 'n') return 'no';
    if (v == 'na' || v == 'n/a') return 'na';
    return null;
  }

  double? _toDouble(String s) {
    final cleaned = s.replaceAll(',', '.');
    return double.tryParse(cleaned);
  }

  bool _evalNumericClause(double value, String clause) {
    final c = clause.replaceAll(' ', '');
    final regex = RegExp(r'^(<=|>=|<|>|==|!=)(-?\d+(?:\.\d+)?)$');
    final m = regex.firstMatch(c);
    if (m == null) return false;
    final op = m.group(1)!;
    final numStr = m.group(2)!;
    final target = double.tryParse(numStr);
    if (target == null) return false;
    switch (op) {
      case '<':
        return value < target;
      case '<=':
        return value <= target;
      case '>':
        return value > target;
      case '>=':
        return value >= target;
      case '==':
        return value == target;
      case '!=':
        return value != target;
    }
    return false;
  }
}

class InspectionSectionWithQuestions {
  final int id;
  final int inspectionFormId;
  final String title;
  final List<InspectionQuestionLite> questions;

  InspectionSectionWithQuestions({
    required this.id,
    required this.inspectionFormId,
    required this.title,
    required this.questions,
  });

  factory InspectionSectionWithQuestions.fromJson(Map<String, dynamic> json) =>
      InspectionSectionWithQuestions(
        id: (json['id'] as num?)?.toInt() ?? 0,
        inspectionFormId: (json['inspection_form_id'] as num?)?.toInt() ?? 0,
        title: (json['title'] as String?) ?? '',
        questions: (json['questions'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .map(InspectionQuestionLite.fromJson)
            .toList(),
      );
}

class InspectionFormFull {
  final int id;
  final int organizationId;
  final String label;
  final String? description;
  final String periodicity;
  final String domain;
  final List<int> inspectorIds;
  final List<int> responsibleIds;
  final List<int> processIds;
  final String? revision;
  final String? version;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? printPath;
  final String? reference;
  final String? status;
  final List<InspectionSectionWithQuestions> sections;

  InspectionFormFull({
    required this.id,
    required this.organizationId,
    required this.label,
    required this.description,
    required this.periodicity,
    required this.domain,
    required this.inspectorIds,
    required this.responsibleIds,
    required this.processIds,
    required this.revision,
    required this.version,
    required this.summary,
    required this.object,
    required this.partieRevisee,
    required this.printPath,
    required this.reference,
    required this.status,
    required this.sections,
  });

  factory InspectionFormFull.fromJson(Map<String, dynamic> json) {
    int? toInt(dynamic e) {
      if (e == null) return null;
      if (e is num) return e.toInt();
      return int.tryParse(e.toString());
    }

    List<int> toIntList(dynamic v) =>
        (v as List<dynamic>? ?? []).map(toInt).whereType<int>().toList();
    return InspectionFormFull(
      id: (json['id'] as num?)?.toInt() ?? 0,
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      label: (json['label'] as String?) ?? '',
      description: json['description'] as String?,
      periodicity: (json['periodicity'] as String?) ?? '',
      domain: (json['domain'] as String?) ?? '',
      inspectorIds: toIntList(json['inspector_ids']),
      responsibleIds: toIntList(json['responsible_ids']),
      processIds: toIntList(json['process_ids']),
      revision: json['revision']?.toString(),
      version: json['version']?.toString(),
      summary: json['summary'] as String?,
      object: json['object'] as String?,
      partieRevisee: json['partie_revisee'] as String?,
      printPath: json['print'] as String?,
      reference: json['reference'] as String?,
      status: json['status'] as String?,
      sections: (json['sections'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(InspectionSectionWithQuestions.fromJson)
          .toList(),
    );
  }
}

class InspectionStatisticsDetail {
  final int totalQuestions;
  final int answeredQuestions;
  final int conformAnswers;
  final int nonConformAnswers;
  final num conformityRate;
  final num completionRate;
  final int nonConformitiesCount;

  InspectionStatisticsDetail({
    required this.totalQuestions,
    required this.answeredQuestions,
    required this.conformAnswers,
    required this.nonConformAnswers,
    required this.conformityRate,
    required this.completionRate,
    required this.nonConformitiesCount,
  });

  factory InspectionStatisticsDetail.fromJson(Map<String, dynamic> json) =>
      InspectionStatisticsDetail(
        totalQuestions: (json['total_questions'] as num?)?.toInt() ?? 0,
        answeredQuestions: (json['answered_questions'] as num?)?.toInt() ?? 0,
        conformAnswers: (json['conform_answers'] as num?)?.toInt() ?? 0,
        nonConformAnswers: (json['non_conform_answers'] as num?)?.toInt() ?? 0,
        conformityRate: (json['conformity_rate'] as num?) ?? 0,
        completionRate: (json['completion_rate'] as num?) ?? 0,
        nonConformitiesCount:
            (json['non_conformities_count'] as num?)?.toInt() ?? 0,
      );
}

class InspectionAnswerItem {
  final int id;
  final int inspectionId;
  final int inspectionQuestionId;
  final String answer;
  final String conformityStatus;
  final String? comment;
  final List<String> imageLinks;
  final String? createdAt;
  final String? updatedAt;
  final InspectionQuestionLite question;

  InspectionAnswerItem({
    required this.id,
    required this.inspectionId,
    required this.inspectionQuestionId,
    required this.answer,
    required this.conformityStatus,
    required this.comment,
    required this.imageLinks,
    required this.createdAt,
    required this.updatedAt,
    required this.question,
  });

  factory InspectionAnswerItem.fromJson(Map<String, dynamic> json) =>
      InspectionAnswerItem(
        id: (json['id'] as num?)?.toInt() ?? 0,
        inspectionId: (json['inspection_id'] as num?)?.toInt() ?? 0,
        inspectionQuestionId:
            (json['inspection_question_id'] as num?)?.toInt() ?? 0,
        answer: (json['answer'] as String?) ?? '',
        conformityStatus: (json['conformity_status'] as String?) ?? '',
        comment: json['comment'] as String?,
        imageLinks: (json['image_links'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        question: InspectionQuestionLite.fromJson(
          json['question'] as Map<String, dynamic>? ?? const {},
        ),
      );
}

class InspectionDetail {
  final int id;
  final int inspectionFormId;
  final int organizationId;
  final List<int> inspectorIds;
  final List<int> siteIds;
  final String mission;
  final String? description;
  final String? otherRemark;
  final String? recommendation;
  final String? inspectedAt;
  final String? createdAt;
  final String? updatedAt;
  final String status;
  final String? revision;
  final String? version;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? printPath;
  final String? reference;
  final Map<int, InspectionUser> inspectors;
  final List<InspectionSite> sites;
  final InspectionStatisticsDetail statistics;
  final InspectionFormFull inspectionForm;
  final List<InspectionAnswerItem> answers;
  final List<dynamic> nonConformities;

  InspectionDetail({
    required this.id,
    required this.inspectionFormId,
    required this.organizationId,
    required this.inspectorIds,
    required this.siteIds,
    required this.mission,
    required this.description,
    required this.otherRemark,
    required this.recommendation,
    required this.inspectedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.revision,
    required this.version,
    required this.summary,
    required this.object,
    required this.partieRevisee,
    required this.printPath,
    required this.reference,
    required this.inspectors,
    required this.sites,
    required this.statistics,
    required this.inspectionForm,
    required this.answers,
    required this.nonConformities,
  });

  factory InspectionDetail.fromJson(Map<String, dynamic> json) {
    int? toInt(dynamic e) {
      if (e == null) return null;
      if (e is num) return e.toInt();
      return int.tryParse(e.toString());
    }

    List<int> toIntList(dynamic v) =>
        (v as List<dynamic>? ?? []).map(toInt).whereType<int>().toList();
    final inspMap = <int, InspectionUser>{};
    final rawInspectors = json['inspectors'];
    if (rawInspectors is Map<String, dynamic>) {
      rawInspectors.forEach((key, value) {
        final k = int.tryParse(key);
        if (k != null && value is Map<String, dynamic>) {
          inspMap[k] = InspectionUser.fromJson(value);
        }
      });
    }
    return InspectionDetail(
      id: (json['id'] as num?)?.toInt() ?? 0,
      inspectionFormId: (json['inspection_form_id'] as num?)?.toInt() ?? 0,
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      inspectorIds: toIntList(json['inspector_ids']),
      siteIds: toIntList(json['site_ids']),
      mission: (json['mission'] as String?) ?? '',
      description: json['description'] as String?,
      otherRemark: json['other_remark'] as String?,
      recommendation: json['recommendation'] as String?,
      inspectedAt: json['inspected_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      status: (json['status'] as String?) ?? '',
      revision: json['revision']?.toString(),
      version: json['version']?.toString(),
      summary: json['summary'] as String?,
      object: json['object'] as String?,
      partieRevisee: json['partie_revisee'] as String?,
      printPath: json['print'] as String?,
      reference: json['reference'] as String?,
      inspectors: inspMap,
      sites: (json['sites'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(InspectionSite.fromJson)
          .toList(),
      statistics: InspectionStatisticsDetail.fromJson(
        json['statistics'] as Map<String, dynamic>? ?? const {},
      ),
      inspectionForm: InspectionFormFull.fromJson(
        json['inspection_form'] as Map<String, dynamic>? ?? const {},
      ),
      answers: (json['answers'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(InspectionAnswerItem.fromJson)
          .toList(),
      nonConformities: json['non_conformities'] as List<dynamic>? ?? [],
    );
  }
}
