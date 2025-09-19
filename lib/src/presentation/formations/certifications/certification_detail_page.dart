import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../_commons_widgets/my_scaffold.dart';
import '../widgets/certifications/certification_detail_body.dart';

@RoutePage()
class CertificationDetailPage extends StatelessWidget {
  static const String routeName = '/certification-detail';
  const CertificationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'CERTIFICATION',
      paddingHorizontale: 0,
      body: CertificationDetailBody(),
    );
  }
}
