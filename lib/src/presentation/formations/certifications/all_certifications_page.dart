import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../_commons_widgets/my_scaffold.dart';
import '../widgets/certifications/all_certifications_body.dart';

@RoutePage()
class AllCertificationsPage extends StatelessWidget {
  static const String routeName = '/all-certifications';
  const AllCertificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'CERTIFICATIONS',
      paddingHorizontale: 0,
      body: CertificationsListBody(),
    );
  }
}
