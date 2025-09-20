import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/add_new_bad_event_body.dart';

@RoutePage()
class AddNewBadEventsPage extends StatelessWidget {
  static const String routeName = '/add-new-bad-events';
  const AddNewBadEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: '',
      paddingHorizontale: 0,
      body: AddNewBadEventBody(),
    );
  }
}
