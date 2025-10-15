import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../injection_container.dart';
import '../../application/inspection/detail/inspection_detail_bloc.dart';
import '../../application/inspection/form/inspection_form_bloc.dart';
import '../../domain/inspection/models/inspection_detail.dart';
import '../../domain/inspection/models/inspection_form_detail.dart';
import '../_commons/route/app_router.gr.dart';
import '../_commons/theming/app_color.dart';
import 'widget/start_inspection_detail_body.dart';
import 'widgets/inspection_create_sheet.dart';

@RoutePage()
class StartInspectionDetailPage extends StatefulWidget {
  static const String routeName = '/start-inspection-detail';
  final int inspectionId;
  final int inspectionFormId;
  const StartInspectionDetailPage({
    super.key,
    required this.inspectionId,
    required this.inspectionFormId,
  });

  @override
  State<StartInspectionDetailPage> createState() =>
      _StartInspectionDetailPageState();
}

class _StartInspectionDetailPageState extends State<StartInspectionDetailPage> {
  InspectionDetail? inspectionDetail;
  InspectionFormDetail? inspectionFormDetail;

  @override
  void initState() {
    super.initState();
  }

  void launchSheet() {
    if (widget.inspectionId == 0 && inspectionFormDetail != null) {
      showInspectionCreateSheet(context, formDetail: inspectionFormDetail!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<InspectionDetailBloc>()
            ..add(
              widget.inspectionId != 0
                  ? InspectionDetailEvent.fetch(id: widget.inspectionId)
                  : const InspectionDetailEvent.reset(),
            ),
        ),
        BlocProvider(
          create: (context) => sl<InspectionFormBloc>()
            ..add(
              widget.inspectionId == 0
                  ? InspectionFormEvent.fetchDetail(id: widget.inspectionFormId)
                  : const InspectionFormEvent.reset(),
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
                context.read<InspectionFormBloc>().add(
                  InspectionFormEvent.fetchDetail(
                    id: state.item!.inspectionFormId,
                  ),
                );
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
        child: widget.inspectionId == 0
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  titleSpacing: 0,
                  title: Text(
                    'NOUVELLE INSPECTION',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Inspection à demarrer'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: inspectionFormDetail == null
                                ? null
                                : () {
                                    launchSheet();
                                  },
                            child: Text(
                              inspectionFormDetail == null
                                  ? 'Veuillez patienter…'
                                  : 'Démarrer l\'inspection',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : StartInspectionDetailBody(
                loading:
                    inspectionDetail == null || inspectionFormDetail == null,
                title: (() {
                  final text = (inspectionDetail?.mission ?? '').trim();
                  if (text.isEmpty) return '';
                  final words = text.split(RegExp(r'\s+'));
                  return words.length <= 7
                      ? text
                      : '${words.take(7).join(' ')}...';
                })(),
                site:
                    inspectionDetail?.sites.map((e) => e.label).join(', ') ??
                    'N/A',
                mission: inspectionDetail?.mission ?? '',
                persons:
                    inspectionFormDetail?.responsibles
                        .map((e) => e.name)
                        .toList() ??
                    [],
                description: inspectionDetail?.description ?? '---',
                onEdit: () {},
                onContinue: () {
                  context.router.push(
                    InspectionSectionRoute(
                      inspectionFormId: inspectionDetail!.inspectionFormId,
                      inspectionId: inspectionDetail!.id,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
