import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/formation_detail_body.dart';

@RoutePage()
class FormationDetailPage extends StatelessWidget {
  static const String routeName = '/formations_sensibilizations';
  const FormationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'Formations',
      paddingHorizontale: 0,
      body: CourseBody(),
    );
  }
}
