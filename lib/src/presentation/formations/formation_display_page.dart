import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/formation/models/formation_course.dart';
import '../_commons_widgets/my_scaffold.dart';
import 'widgets/formation_display_body.dart';

@RoutePage()
class FormationDisplayPage extends StatelessWidget {
  static const String routeName = '/formations-display';
  final int formationId;
  final FormationCourse? course;
  const FormationDisplayPage({
    super.key,
    required this.formationId,
    this.course,
  });

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'Formations',
      paddingHorizontale: 0,
      body: CourseDisplayBody(formationId: formationId, course: course),
    );
  }
}
