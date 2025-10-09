import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../injection_container.dart';
import '../../../application/actions/actions_bloc.dart';
import '../../../application/audit/detail/audit_detail_bloc.dart';
import '../../../domain/audit/models/audit_item.dart';
import '../../../domain/audit/models/audit_observation.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/empty_widget.dart';
import '../../_commons_widgets/loading_widget.dart';
import 'bottom_sheet_add_constat.dart';

class AuditDetailBody extends StatefulWidget {
  final AuditItem audit;
  const AuditDetailBody({super.key, required this.audit});

  @override
  State<AuditDetailBody> createState() => _AuditDetailBodyState();
}

class _AuditDetailBodyState extends State<AuditDetailBody>
    with TickerProviderStateMixin {
  late final TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 4, vsync: this);
    BlocProvider.of<ActionsBloc>(context).add(
      ActionsEvent.fetchByOrigin(
        originType: 'Audit',
        originId: widget.audit.id,
      ),
    );
  }

  TextStyle get _title => GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.15,
  );

  TextStyle get _label => GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  TextStyle get _value =>
      GoogleFonts.poppins(fontSize: 13.5, color: Colors.black87);

  bool addContact = false;

  @override
  Widget build(BuildContext context) {
    final onBlue = Colors.white;
    final blue = AppColors.primary;

    return BlocProvider(
      create: (context) => sl<AuditDetailBloc>()
        ..add(AuditDetailEvent.documentsRequested(id: widget.audit.id))
        ..add(AuditDetailEvent.fetchResults(id: widget.audit.id))
        ..add(AuditDetailEvent.conclusionRequested(id: widget.audit.id))
        ..add(AuditDetailEvent.observationsRequested(id: widget.audit.id)),
      child: BlocBuilder<AuditDetailBloc, AuditDetailState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: addContact
                ? FloatingActionButton(
                    backgroundColor: blue,
                    shape: const CircleBorder(),
                    onPressed: () => showAddConstatSheet(
                      context,
                      auditId: widget.audit.id,
                      auditBloc: context.read<AuditDetailBloc>(),
                    ),
                    child: const Icon(Icons.add),
                  )
                : null,
            body: DefaultTabController(
              length: 4,
              child: NestedScrollView(
                headerSliverBuilder: (c, _) => [
                  SliverToBoxAdapter(
                    child: _Header(
                      blue: blue,
                      onBlue: onBlue,
                      audit: widget.audit,
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _TabsDelegate(
                      TabBar(
                        controller: _tab,
                        onTap: (index) {
                          if (index == 1) {
                            addContact = true;
                          } else {
                            addContact = false;
                          }
                          setState(() {});
                        },
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        indicatorColor: blue,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black54,
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        tabs: const [
                          Tab(text: 'Descriptions'),
                          Tab(text: 'Liste des constats'),
                          Tab(text: 'Resultats'),
                          Tab(text: 'Actions'),
                        ],
                      ),
                    ),
                  ),
                ],
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tab,
                  children: [
                    _DescriptionTab(
                      title: _title,
                      label: _label,
                      value: _value,
                      audit: widget.audit,
                    ),
                    _ConstatsTab(state: state),
                    _ResultatsTab(state: state),
                    const _ActionsTab(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ---------- SLIVER TAB HEADER
class _TabsDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _TabsDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height + 4;

  @override
  double get minExtent => tabBar.preferredSize.height + 4;

  @override
  bool shouldRebuild(covariant _TabsDelegate oldDelegate) =>
      oldDelegate.tabBar != tabBar;
}

/// ---------- HEADER (titre + méta + bouton)
class _Header extends StatelessWidget {
  const _Header({
    required this.blue,
    required this.onBlue,
    required this.audit,
  });
  final Color blue;
  final Color onBlue;
  final AuditItem audit;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.tryParse(audit.startDate ?? '') ?? DateTime.now();
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            audit.label,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _Meta(
                label: 'Date',
                value:
                    '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}',
              ),
              const SizedBox(width: 18),
              _Meta(label: 'Ref', value: '${audit.reference}'),
              const SizedBox(width: 18),
              _Meta(label: 'Ver', value: '${audit.version}'),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 44,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: blue, width: 1.6),
                    foregroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Soumettre a la validation',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(color: Colors.black87, fontSize: 13.5),
        children: [
          TextSpan(
            text: '$label : ',
            style: const TextStyle(color: Colors.black54),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

/// ---------- TABS CONTENT

class _DescriptionTab extends StatelessWidget {
  const _DescriptionTab({
    required this.title,
    required this.label,
    required this.value,
    required this.audit,
  });

  final TextStyle title, label, value;
  final AuditItem audit;

  @override
  Widget build(BuildContext context) {
    Widget tile(String k, String v) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(k, style: value),
          Text(v, style: label),
        ],
      ),
    );

    Widget point(String t, String d, String ref) => _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Titre', style: label.copyWith(color: Colors.black54)),
          const SizedBox(height: 4),
          Text(t, style: value),
          const Divider(height: 14),
          Text('Description', style: label.copyWith(color: Colors.black54)),
          const SizedBox(height: 4),
          Text(d, style: value),
          const Divider(height: 14),
          Text('Reference', style: label.copyWith(color: Colors.black54)),
          const SizedBox(height: 4),
          Text(ref, style: value),
        ],
      ),
    );

    Widget docItem(String name, String path) => GestureDetector(
      onTap: () {
        context.router.push(FilePreviewRoute(path: path, fileName: name));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            const Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                name,
                style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 26),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            tile(
              'Date de debut',
              DateFormat.yMMMd(
                Localizations.localeOf(context).languageCode,
              ).format(
                DateTime.tryParse(audit.startDate ?? '') ?? DateTime.now(),
              ),
            ),
            tile(
              'Date fin',
              DateFormat.yMMMd(
                Localizations.localeOf(context).languageCode,
              ).format(
                DateTime.tryParse(audit.endDate ?? '') ?? DateTime.now(),
              ),
            ),
          ],
        ),
        const Divider(height: 6),
        tile('Audité', audit.auditor != null ? audit.auditor.toString() : ''),
        const Divider(height: 6),
        tile(
          'Processus concerné',
          audit.process != null ? audit.process!.title : '',
        ),
        const SizedBox(height: 14),
        Text('Points à controler', style: title),
        const SizedBox(height: 8),
        ...audit.controlPointsSummary.map(
          (e) => point(e.title, e.description ?? '', e.reference ?? '---'),
        ),

        BlocBuilder<AuditDetailBloc, AuditDetailState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                Text('Documents', style: title),
                const SizedBox(height: 8),
                if (state.isLoadingDocuments)
                  const Center(child: LoadingWidget())
                else if (state.documentRequests.isEmpty)
                  const Text('Aucun document disponible')
                else
                  ...state.documentRequests.map(
                    (d) => _Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          tile('Requete de documents', d.name),
                          const Divider(height: 6),
                          const SizedBox(height: 6),
                          if (d.documents.isEmpty)
                            const Text('Aucun document attaché')
                          else
                            ...d.documents.map(
                              (doc) => docItem(
                                doc.documentPath.split('/').last,
                                doc.documentPath,
                              ),
                            ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),

        const SizedBox(height: 18),
      ],
    );
  }
}

class _ConstatsTab extends StatelessWidget {
  const _ConstatsTab({required this.state});
  final AuditDetailState state;

  @override
  Widget build(BuildContext context) {
    Widget pdf(String name) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
          const SizedBox(width: 8),
          Text(
            name,
            style: GoogleFonts.poppins(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
    return state.isLoadingObservations
        ? const Center(child: LoadingWidget())
        : state.observations.isEmpty
        ? Center(child: EmptyWidget.noData())
        : ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 90),
            itemCount: state.observations.length,
            itemBuilder: (_, i) {
              final AuditObservation c = state.observations[i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(c.description, style: GoogleFonts.poppins()),
                      const SizedBox(height: 10),
                      ...c.documents.map(pdf),
                      const Divider(height: 24),
                      // Text(
                      //   'Commentaire',
                      //   style: GoogleFonts.poppins(
                      //     fontWeight: FontWeight.w600,
                      //     color: Colors.black87,
                      //   ),
                      // ),
                      // const SizedBox(height: 8),
                      // Row(
                      //   children: [
                      //     const _Avatar('MH'),
                      //     const SizedBox(width: 10),
                      //     Expanded(
                      //       child: Text(
                      //         '${c.commentaireAuteur}\n${c.commentaire}',
                      //         style: GoogleFonts.poppins(),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 8),
                      // Row(
                      //   children: [
                      //     const Icon(Icons.reply, size: 18, color: Colors.grey),
                      //     const SizedBox(width: 6),
                      //     Text(
                      //       'Repondre',
                      //       style: GoogleFonts.poppins(color: Colors.black54),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}

class _ResultatsTab extends StatelessWidget {
  const _ResultatsTab({required this.state});
  final AuditDetailState state;

  @override
  Widget build(BuildContext context) {
    return state.isLoadingResults
        ? const Center(child: LoadingWidget())
        : state.results.isEmpty
        ? Center(child: EmptyWidget.noData())
        : ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 26),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.router.push(const AuditControlObjectifRoute());
                      },
                      label: Text(
                        'Ajouter',
                        style: GoogleFonts.inter(fontSize: 15),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              ...state.results.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Point de control et objectif',
                                style: GoogleFonts.poppins(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              'Statut : ',
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              e.humanizedStatus,
                              style: GoogleFonts.poppins(
                                color: e.statutColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          e.controlPoint?.title ?? '',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          e.controlPoint?.description ?? '',
                          style: GoogleFonts.poppins(),
                        ),
                        const Divider(height: 14),
                        Text(
                          'Preuves',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 6),
                        ...e.attachments.map(
                          (p) => GestureDetector(
                            onTap: () {
                              context.router.push(FilePreviewRoute(path: p));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    p,
                                    style: GoogleFonts.poppins(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(height: 14),

                        Text(
                          'Conclusion',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(e.description, style: GoogleFonts.poppins()),
                      ],
                    ),
                  ),
                ),
              ),
              _Card(
                color: const Color(0xFFE3EDFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conclusion Générale',
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        state.conclusion?.humanizedGeneralConclusion ?? '',
                        style: GoogleFonts.poppins(
                          color: state.conclusion?.statutColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      state.conclusion?.generalConclusion ?? '',
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class _ActionsTab extends StatelessWidget {
  const _ActionsTab();

  @override
  Widget build(BuildContext context) {
    final label = GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    );

    // Widget pdf(String name) => Row(
    //   children: [
    //     const Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
    //     const SizedBox(width: 8),
    //     Text(
    //       name,
    //       style: GoogleFonts.poppins(decoration: TextDecoration.underline),
    //     ),
    //   ],
    // );

    return BlocBuilder<ActionsBloc, ActionsState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 26),
          children: [
            if (state.isLoading)
              const Center(child: LoadingWidget())
            else if (state.originItems == null || state.originItems!.isEmpty)
              EmptyWidget.noData()
            else
              ...state.originItems!.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.withValues(alpha: .1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item.humanReadableType,
                                style: GoogleFonts.poppins(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            // Assets.svgs.pen.svg(),
                            // const Icon(
                            //   Icons.delete_outline_rounded,
                            //   size: 18,
                            //   color: Colors.red,
                            // ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.actionName,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('Processus', style: label),
                        const SizedBox(height: 4),
                        Text(
                          item.process?.title ?? '',
                          style: GoogleFonts.poppins(),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Justifications', style: label),
                            Text(
                              item.humanReadableJustificationType,
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFE53935),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.justification ?? '',
                          style: GoogleFonts.poppins(),
                        ),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Type Origine', style: label),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.humanReadableOrigin,
                                    style: GoogleFonts.poppins(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Text(
                                item.originType ?? '',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text('Responsable', style: label),
                        const SizedBox(height: 6),
                        Text(
                          item.inChargeName ?? '',
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ],
        );
      },
    );
  }
}

/// ---------- SMALL BUILDING BLOCKS

class _Card extends StatelessWidget {
  const _Card({required this.child, this.color});
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -6,
            offset: Offset(0, 6),
            color: Color(0x1A000000),
          ),
        ],
      ),
      child: child,
    );
  }
}
