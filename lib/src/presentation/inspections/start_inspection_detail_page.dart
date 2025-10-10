import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../application/inspection/detail/inspection_detail_bloc.dart';
import '../../application/inspection/form/inspection_form_bloc.dart';
import '../../domain/inspection/models/inspection_detail.dart';
import '../../domain/inspection/models/inspection_form_detail.dart';
import '../../domain/inspection/models/inspection_item.dart';
import '../_commons/route/app_router.gr.dart';
import 'widget/start_inspection_detail_body.dart';

@RoutePage()
class StartInspectionDetailPage extends StatefulWidget {
  static const String routeName = '/start-inspection-detail';
  final InspectionItem inspection;
  const StartInspectionDetailPage({super.key, required this.inspection});

  @override
  State<StartInspectionDetailPage> createState() =>
      _StartInspectionDetailPageState();
}

class _StartInspectionDetailPageState extends State<StartInspectionDetailPage> {
  InspectionDetail? inspectionDetail;
  InspectionFormDetail? inspectionFormDetail;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<InspectionDetailBloc>()
                ..add(InspectionDetailEvent.fetch(id: widget.inspection.id)),
        ),
        BlocProvider(
          create: (context) => sl<InspectionFormBloc>()
            ..add(
              InspectionFormEvent.fetchDetail(
                id: widget.inspection.inspectionFormId,
              ),
            ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<InspectionDetailBloc, InspectionDetailState>(
            listener: (context, state) {
              if (state.item != null) {
                setState(() {
                  inspectionDetail = state.item;
                });
              }
            },
          ),
          BlocListener<InspectionFormBloc, InspectionFormState>(
            listener: (context, state) {
              if (state.detail != null) {
                setState(() {
                  inspectionFormDetail = state.detail;
                });
              }
            },
          ),
        ],
        child: StartInspectionDetailBody(
          loading: inspectionDetail == null || inspectionFormDetail == null,
          title: (() {
            final text = (inspectionDetail?.mission ?? '').trim();
            if (text.isEmpty) return '';
            final words = text.split(RegExp(r'\s+'));
            return words.length <= 7 ? text : '${words.take(7).join(' ')}...';
          })(),
          site: inspectionDetail?.sites.map((e) => e.label).join(', ') ?? 'N/A',
          mission: inspectionDetail?.mission ?? '',
          persons:
              inspectionFormDetail?.responsibles.map((e) => e.name).toList() ??
              [],
          description: inspectionDetail?.description ?? '---',
          onEdit: () {},
          onContinue: () {
            context.router.push(
              InspectionSectionRoute(
                inspectionFormId: widget.inspection.id,
                inspectionId: widget.inspection.inspectionFormId,
              ),
            );
          },
        ),
      ),
    );
  }
}
