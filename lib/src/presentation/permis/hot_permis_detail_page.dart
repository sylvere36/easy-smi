import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/permit/models/permit_item.dart';
import '../_commons_widgets/my_scaffold.dart';
import 'widgets/hot_permis_detail_body.dart';

@RoutePage()
class HotPermisDetailPage extends StatelessWidget {
  final PermitItem permit;
  const HotPermisDetailPage({super.key, required this.permit});
  static const String routeName = '/hot-permis';

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'PERMIS A CHAUD',
      paddingHorizontale: 0,
      body: HotPermitDetailBody(permit: permit),
    );
  }
}
