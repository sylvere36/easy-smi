import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/audit/models/audit_item.dart';
import '../_commons_widgets/my_scaffold.dart';
import 'widgets/audit_detail_body.dart';

@RoutePage()
class AuditDetailPage extends StatelessWidget {
  static const String routeName = '/audits-detail';
  final AuditItem audit;
  const AuditDetailPage({super.key, required this.audit});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'AUDIT',
      paddingHorizontale: 0,
      body: AuditDetailBody(audit: audit),
    );
  }
}
