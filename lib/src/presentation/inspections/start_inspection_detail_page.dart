import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_commons/route/app_router.gr.dart';
import 'widget/start_inspection_detail_body.dart';

@RoutePage()
class StartInspectionDetailPage extends StatelessWidget {
  static const String routeName = '/start-inspection-detail';
  const StartInspectionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StartInspectionDetailBody(
      title:
          'Inspection sur la securite zone de stockage des produits chimiques',
      site: 'Site PAC Cotonou , Zone de dechargement',
      mission:
          'Control des esquipement de travail au niveau du port autonome de Cotonou',
      persons: const ['Jean yves GOTO'],
      description:
          'Control des esquipement de travail auu du port autonome de Cotonou...'
          ' Control des esquipement de travail au niveau du port autonome de Cotonou',
      onEdit: () {},
      onContinue: () {
        context.router.push(const InspectionSectionRoute());
      },
    );
  }
}
