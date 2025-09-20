import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/hot_permis_detail_body.dart';

@RoutePage()
class HotPermisDetailPage extends StatelessWidget {
  static const String routeName = '/hot-permis';
  const HotPermisDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'PERMIS A CHAUD',
      paddingHorizontale: 0,
      body: HotPermitDetailBody(),
    );
  }
}
