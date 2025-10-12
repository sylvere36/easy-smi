import 'quizz_question.dart';

class QuizzItem {
  final int id;
  final String title;
  final String? descriptionHtml;
  final String image;
  final int? categoryId;
  final int? duree;
  final int? certification;
  final num? tauxDeReussite;
  final String? texteCertificat;
  final int? organizationId;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;
  final List<QuizzQuestion> questions;

  QuizzItem({
    required this.id,
    required this.title,
    required this.descriptionHtml,
    required this.image,
    required this.categoryId,
    required this.duree,
    required this.certification,
    required this.tauxDeReussite,
    required this.texteCertificat,
    required this.organizationId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.questions,
  });

  factory QuizzItem.fromJson(Map<String, dynamic> json) {
    final rawQuestions = (json['questionquizz'] as List<dynamic>?) ?? const [];
    return QuizzItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: (json['title'] as String?) ?? '',
      descriptionHtml: json['description'] as String?,
      image: (json['image'] as String?) ?? '',
      categoryId: (json['category_id'] as num?)?.toInt(),
      duree: (json['duree'] as num?)?.toInt(),
      certification: (json['certification'] as num?)?.toInt(),
      tauxDeReussite: json['taux_de_reussite'] as num?,
      texteCertificat: json['texte_certificat'] as String?,
      organizationId: (json['organization_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      createdAt:
          (json['created_at'] as String?) ?? (json['createdAt'] as String?),
      updatedAt:
          (json['updated_at'] as String?) ?? (json['updatedAt'] as String?),
      questions: rawQuestions
          .whereType<Map<String, dynamic>>()
          .map(QuizzQuestion.fromJson)
          .toList(),
    );
  }
}
