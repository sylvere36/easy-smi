import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../application/inspection/detail/inspection_detail_bloc.dart';
import '../../domain/inspection/models/inspection_answers_post.dart';
import '../_commons_widgets/my_scaffold.dart';
import 'widget/inspection_result_body.dart';

@RoutePage()
class InspectionResultPage extends StatelessWidget {
  static const String routeName = '/inspection-result';
  const InspectionResultPage({
    super.key,
    this.answersBySection = const {},
    this.sectionTitles = const {},
    this.questionTitles = const {},
    required this.inspectionId,
    required this.inspectionFormId,
  });

  final Map<int, List<InspectionAnswerPostItem>> answersBySection;
  final Map<int, String> sectionTitles;
  final Map<int, String> questionTitles;
  final int inspectionId;
  final int inspectionFormId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<InspectionDetailBloc>()
            ..add(InspectionDetailEvent.fetch(id: inspectionId)),
      child: MyScaffold(
        appBarTitle: 'RÉSULTAT DE L\'INSPECTION',
        paddingHorizontale: 0,
        body: InspectionResultBody(
          answersBySection: answersBySection,
          sectionTitles: sectionTitles,
          questionTitles: questionTitles,
          inspectionId: inspectionId,
          inspectionFormId: inspectionFormId,
        ),
      ),
    );
  }
}
