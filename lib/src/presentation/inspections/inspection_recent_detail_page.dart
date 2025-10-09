import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/inspection/models/inspection_form_item.dart';
import '../_commons_widgets/my_scaffold.dart';
import 'widget/inspection_recent_detail_body.dart';

@RoutePage()
class InpectionRecentDetailPage extends StatelessWidget {
  static const String routeName = '/inspection-recent-detail';
  final InspectionFormItem item;
  const InpectionRecentDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'INSPECTION',
      body: InspectionRecentDetailBody(item: item),
    );
  }
}
