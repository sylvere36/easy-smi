import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../application/inspection/form/inspection_form_bloc.dart';

import '../../domain/inspection/models/inspection_answers_post.dart';
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
    return BlocProvider(
      create: (_) =>
          sl<InspectionFormBloc>()
            ..add(InspectionFormEvent.fetchStructure(id: inspectionFormId)),
      child: SectionFlowScreen(
        inspectionId: inspectionId,
        inspectionFormId: inspectionFormId,
        title: 'INSPECTION',
      ),
    );
  }
}
