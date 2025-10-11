import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/formation_detail_body.dart';

@RoutePage()
class FormationDetailPage extends StatelessWidget {
  static const String routeName = '/formations_sensibilizations';
  final int formationId;
  const FormationDetailPage({super.key, required this.formationId});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'Formations',
      paddingHorizontale: 0,
      body: CourseBody(formationId: formationId),
    );
  }
}
