import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widget/section_flow.dart';

@RoutePage()
class InspectionSectionPage extends StatelessWidget {
  static const String routeName = '/inspection-section';
  const InspectionSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionFlowScreen(
      title:
          'Inspection sur la securite zone de stockage des produits chimiques',
    );
  }
}
