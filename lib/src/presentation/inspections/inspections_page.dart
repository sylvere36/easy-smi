import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widget/inspections_body.dart';

@RoutePage()
class InspectionsPage extends StatelessWidget {
  static const String routeName = '/inspections';
  const InspectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'INSPECTIONS',
      body: InspectionsBody(),
    );
  }
}
