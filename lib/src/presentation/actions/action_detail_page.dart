import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../domain/action/models/action_item.dart';
import '../_commons_widgets/my_scaffold.dart';
import 'widget/action_detail_body_widget.dart';

@RoutePage()
class ActionDetailPage extends StatelessWidget {
  static const String routeName = '/action-detail';

  final ActionItem action;
  const ActionDetailPage({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'ACTION',
      paddingHorizontale: 0,
      body: ActionDetailBody(action: action),
    );
  }
}
