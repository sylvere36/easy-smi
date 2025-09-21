import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/sensibilization_detail_body.dart';

@RoutePage()
class SensibilizationDetailPage extends StatelessWidget {
  static const String routeName = '/sensibilizations';
  const SensibilizationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'SENSIBILISATIONS',
      paddingHorizontale: 0,
      body: SensibilisationDetailBody(),
    );
  }
}
