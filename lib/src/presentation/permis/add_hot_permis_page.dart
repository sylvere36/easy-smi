import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/add_hot_permis_body.dart';

@RoutePage()
class AddHotPermisPage extends StatelessWidget {
  static const String routeName = '/add-hot-permis';
  const AddHotPermisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBarTitle: 'PERMIS A CHAUD',
      paddingHorizontale: 0,
      body: AddHotPermisBody(),
    );
  }
}
