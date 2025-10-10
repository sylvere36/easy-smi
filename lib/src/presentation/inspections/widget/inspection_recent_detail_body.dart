import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../injection_container.dart';
import '../../../application/communication/comments_bloc.dart';
import '../../../application/inspection/form/inspection_form_bloc.dart';
import '../../../application/inspection/inspections_bloc.dart';
import '../../../domain/inspection/models/inspection_form_item.dart';
import '../../../domain/inspection/models/inspection_item.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_size.dart';
import '../../_commons_widgets/comments/comment_field.dart';
import '../../_commons_widgets/empty_widget.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../comments/widgets/resume_comment_widget.dart';

class InspectionRecentDetailBody extends StatefulWidget {
  final InspectionFormItem item;
  const InspectionRecentDetailBody({super.key, required this.item});

  @override
  State<InspectionRecentDetailBody> createState() =>
      _InspectionRecentDetailBodyState();
}

class _InspectionRecentDetailBodyState
    extends State<InspectionRecentDetailBody> {
  String commentTableType = 'Inspection';
  InspectionFormItem get item => widget.item;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<InspectionsBloc>(
      context,
    ).add(const InspectionsEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<InspectionFormBloc>()
            ..add(InspectionFormEvent.fetchDetail(id: item.id)),
      child: BlocConsumer<InspectionFormBloc, InspectionFormState>(
        listener: (context, state) {
          if (state.detail != null) {
            context.read<CommentsBloc>().add(
              CommentsEvent.fetchRequested(
                commentableType: commentTableType,
                commentableId: state.detail!.id,
              ),
            );
          }
        },
        builder: (context, state) {
          return state.isLoadingDetail
              ? const Center(child: LoadingWidget())
              : state.detail == null
              ? EmptyWidget.error(title: 'No details available')
              : ListView(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                  children: [
                    // ---- Title chips (deux lignes)
                    _titleChip(state.detail!.description ?? '---'),

                    // ---- Meta + Demarrer
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 14,
                            runSpacing: 6,
                            children: [
                              _Meta(
                                label: 'Date',
                                value: state.detail!.createdAt == null
                                    ? '---'
                                    : DateFormat('dd-MM-yyyy').format(
                                        DateTime.parse(
                                          state.detail!.createdAt!,
                                        ),
                                      ),
                              ),
                              _Meta(
                                label: 'Ref',
                                value: state.detail!.reference ?? '---',
                              ),
                              _Meta(
                                label: 'Ver',
                                value: state.detail!.version ?? '---',
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [const Spacer(), _startButton()],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ----------- zone commentaire -----------
                    // Comment composer
                    // ----------- zone commentaire -----------
                    BlocBuilder<CommentsBloc, CommentsState>(
                      builder: (context, commentState) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: CommentFieldWidget(
                            isLoading: commentState.isSubmitting,
                            onSend: (String text, File? file) {
                              BlocProvider.of<CommentsBloc>(context).add(
                                CommentsEvent.addCommentRequested(
                                  commentableType: commentTableType,
                                  commentableId: state.detail!.id,
                                  attachmentPath: file?.path,
                                  body: text,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),

                    // Comments header + tiny list
                    ResumeCommentWidget(
                      commentableType: commentTableType,
                      commentableId: state.detail!.id,
                      commentsCount: BlocProvider.of<CommentsBloc>(
                        context,
                        listen: true,
                      ).state.items.length,
                    ),

                    // ---- Historiques section
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F2FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            // header
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                14,
                                12,
                                14,
                                12,
                              ),
                              child: Row(
                                children: [
                                  Assets.svgs.jamBlue.svg(),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Historiques',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                children: [
                                  ...BlocProvider.of<InspectionsBloc>(
                                        context,
                                      ).state.items?.map(
                                        (h) => _HistoryTile(inspectionItem: h),
                                      ) ??
                                      [const SizedBox.shrink()],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

Container _titleChip(String text) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFF1F4FB),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          height: 1.2,
        ),
      ),
    ),
  );
}

class _Meta extends StatelessWidget {
  final String label;
  final String value;
  const _Meta({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label : ',
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
        ),
      ],
    );
  }
}

Container _startButton() {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1864EA),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Row(
        children: [
          Text(
            'DEMARRER',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    ),
  );
}

class _HistoryTile extends StatelessWidget {
  final InspectionItem inspectionItem;
  const _HistoryTile({required this.inspectionItem});

  @override
  Widget build(BuildContext context) {
    final isConforme = inspectionItem.isConforme;
    final color = isConforme
        ? const Color(0xFF08A87D)
        : const Color(0xFFE9362E);
    final label = isConforme ? 'Conforme' : 'Non conforme';

    return Column(
      children: [
        // row 1: label + date + download
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    inspectionItem.inspectedAt == null
                        ? '---'
                        : DateFormat(
                            'dd / MM / yyyy',
                          ).format(DateTime.parse(inspectionItem.inspectedAt!)),
                    style: const TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // row 2: title + icon
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      inspectionItem.otherRemark ?? '---',
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      inspectionItem.recommendation ?? '---',
                      style: TextStyle(
                        fontSize: AppSize.getSize(
                          context: context,
                          mobileValue: 12,
                        ),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (inspectionItem.printPath == null) return;
                  AutoRouter.of(
                    context,
                  ).push(FilePreviewRoute(path: inspectionItem.printPath!));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.download_rounded,
                    size: 26,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
        // divider
        Container(height: 1, color: const Color(0xFFECECEC)),
      ],
    );
  }
}
