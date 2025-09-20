import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/bad_event_detail_body.dart';

@RoutePage()
class BadEventsDetailPage extends StatelessWidget {
  static const String routeName = '/bad-event-detail';
  const BadEventsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'EVENEMENTS NON DESIRABLES',
      paddingHorizontale: 0,
      body: BadEventDetailBody(),
    );
  }
}
