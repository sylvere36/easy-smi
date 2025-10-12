import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/quizz/models/quizz_item.dart';
import '../../_commons_widgets/my_scaffold.dart';
import '../widgets/certifications/certification_detail_body.dart';

@RoutePage()
class CertificationDetailPage extends StatelessWidget {
  static const String routeName = '/certification-detail';
  final QuizzItem quizzItem;
  const CertificationDetailPage({super.key, required this.quizzItem});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'CERTIFICATION',
      paddingHorizontale: 0,
      body: CertificationDetailBody(quizzItem: quizzItem),
    );
  }
}
