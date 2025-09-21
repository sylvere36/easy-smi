import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widget/inspection_result_body.dart';

@RoutePage()
class InspectionResultPage extends StatelessWidget {
  static const String routeName = '/inspection-result';
  const InspectionResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'RÉSULTAT DE L\'INSPECTION',
      paddingHorizontale: 0,
      body: InspectionResultBody(),
    );
  }
}
