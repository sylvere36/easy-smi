import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/formation_display_body.dart';

@RoutePage()
class FormationDisplayPage extends StatelessWidget {
  static const String routeName = '/formations-display';
  final int formationId;
  const FormationDisplayPage({super.key, required this.formationId});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'Formations',
      paddingHorizontale: 0,
      body: CourseDisplayBody(formationId: formationId),
    );
  }
}
