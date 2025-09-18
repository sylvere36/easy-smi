import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widget/inspection_recent_detail_body.dart';

@RoutePage()
class InpectionRecentDetailPage extends StatelessWidget {
  static const String routeName = '/inspection-recent-detail';
  const InpectionRecentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'INSPECTION',
      body: InspectionRecentDetailBody(),
    );
  }
}
