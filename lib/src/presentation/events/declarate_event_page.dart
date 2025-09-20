import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/declarer_event_body.dart';

@RoutePage()
class DeclarateEventPage extends StatelessWidget {
  static const String routeName = '/declarate-events';
  const DeclarateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'Declarer un evenement',
      paddingHorizontale: 0,
      body: DeclarerEventBody(),
    );
  }
}
