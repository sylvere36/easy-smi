import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widget/section_flow.dart';

@RoutePage()
class InspectionSectionPage extends StatelessWidget {
  static const String routeName = '/inspection-section';
  final int inspectionId;
  final int inspectionFormId;

  const InspectionSectionPage({
    super.key,
    required this.inspectionId,
    required this.inspectionFormId,
  });

  @override
  Widget build(BuildContext context) {
    return SectionFlowScreen(
      inspectionId: inspectionId,
      inspectionFormId: inspectionFormId,
      title: 'inspectionItem.mission',
    );
  }
}
