import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/audit_detail_body.dart';

@RoutePage()
class AuditDetailPage extends StatelessWidget {
  static const String routeName = '/audits-detail';
  const AuditDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'AUDIT',
      paddingHorizontale: 0,
      body: AuditDetailBody(),
    );
  }
}
