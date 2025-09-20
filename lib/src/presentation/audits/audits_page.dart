import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons_widgets/my_scaffold.dart';
import 'widgets/audits_widget.dart';

@RoutePage()
class AuditsPage extends StatelessWidget {
  static const String routeName = '/audits';
  const AuditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'AUDITS',
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: List.generate(
            8,
            (index) => const AuditCard(
              tag: 'Interne',
              status: 'En cours',
              title:
                  'Audits sur les activités internes liées aux dechargements des marchandises',
              process: 'Marketing international et developpment',
            ),
          ),
        ),
      ),
    );
  }
}
