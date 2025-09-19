import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../_commons_widgets/my_scaffold.dart';
import '../widgets/certifications/my_certifications_body.dart';

@RoutePage()
class MyCertificationsPage extends StatelessWidget {
  static const String routeName = '/my-certifications';
  const MyCertificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'MES CERTIFICATIONS',
      paddingHorizontale: 0,
      body: MyCertificationsBody(),
    );
  }
}
