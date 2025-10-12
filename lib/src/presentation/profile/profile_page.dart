import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/assets.gen.dart';
import '../../application/auth/user/authenticated_user_bloc.dart';
import '../_commons/route/app_router.gr.dart';
import '../_commons/theming/app_color.dart';
import '../_commons_widgets/comments/avatar.dart';
import '../_commons_widgets/loading_widget.dart';
import '../_commons_widgets/my_scaffold.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // UI palette
  final Color kBlue = const Color(0xFF0C56B3);
  final Color kGreen = const Color(0xFF20B265);
  final Color kDanger = const Color(0xFFE53935);
  final Color kGreyText = const Color(0xFF5D667A);

  final bool _showNew = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticatedUserBloc>(
      context,
    ).add(const AuthenticatedUserEvent.fetchRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatedUserBloc, AuthenticatedUserState>(
      builder: (context, state) {
        return MyScaffold(
          backgroundColor: const Color(0xFFF5F7FA),
          appBarTitle: 'MON PLANNING',
          body: state.user == null
              ? const Center(child: LoadingWidget())
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: _ProfileHeader(
                          name: state.user?.name ?? '---',
                          email: state.user?.email ?? '---',
                          statusText: 'CONFORME',
                          statusColor: kGreen,
                          expireText: 'expire le 17 Oct 2026',
                          avatarUrl:
                              'https://picsum.photos/seed/avatarcc/240/240', // replace with real picture

                          expanded: _showNew,
                          // onTapAction: () => setState(() => _showNew = !_showNew),
                        ),
                      ),
                    ),

                    // ---- Competences table ----
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 14, 0, 8),
                        child: _CompetencesBox(
                          onSeeMore: () {},
                          rows: const [
                            _CompRow(title: 'Formation ISO 9001 & ISO 45001'),
                            _CompRow(title: 'Formation ISO 9001 & ISO 45001'),
                            _CompRow(title: 'Formation ISO 9001 & ISO 45001'),
                          ],
                        ),
                      ),
                    ),

                    // ---- Section: Parcours de competence ----
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 45, bottom: 10),
                        child: _SectionHeader(
                          emojiIcon: Icons.star_border_rounded,
                          title: 'Parcours de  competence',
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: _PlainHeader(title: 'Diplôme / Certificat'),
                    ),
                    SliverList.list(
                      children: const [
                        _SectionBlock(
                          children: [
                            _TimelineItem(
                              title: 'Systeme de Management de Qualité',
                              status: _Status.valid,
                              dateLabel: 'Mars 2025',
                            ),
                            _DashedSeparator(),
                            _TimelineItem(
                              title: 'Comptabilté',
                              status: _Status.expired,
                              dateLabel: 'Mars 2025',
                            ),
                            _DashedSeparator(),
                            _TimelineItem(
                              title: 'Manager SMI',
                              status: _Status.notValid,
                              dateLabel: null,
                            ),
                          ],
                        ),
                      ],
                    ),

                    // ---- Formations ----
                    const SliverToBoxAdapter(
                      child: _PlainHeader(title: 'Formations'),
                    ),
                    SliverList.list(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: _SectionBlock(
                            children: [
                              _TimelineItem(
                                title: 'Formation de Management de Qualité',
                                status: _Status.valid,
                                dateLabel: 'Mars 2025',
                              ),
                              _DashedSeparator(),
                              _TimelineItem(
                                title: 'Formation Comptabilté',
                                status: _Status.expired,
                                dateLabel: 'Mars 2025',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // ---- Sensibilisations ----
                    const SliverToBoxAdapter(
                      child: _PlainHeader(title: 'Sensibilisations'),
                    ),
                    SliverList.list(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: _SectionBlock(
                            children: [
                              _TimelineItem(
                                title:
                                    'Sensibilisation de Management de Qualité',
                                status: _Status.valid,
                                dateLabel: 'Mars 2025',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // ---- Evaluation ----
                    const SliverToBoxAdapter(
                      child: _PlainHeader(title: 'Evaluation'),
                    ),
                    SliverList.list(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: _SectionBlock(
                            children: [
                              _TimelineItem(
                                title: 'Quizz de formation audit',
                                status: _Status.valid,
                                dateLabel: 'Mars 2025',
                              ),
                              _DashedSeparator(),

                              _TimelineItem(
                                title: 'Quizz de formation audit',
                                status: _Status.valid,
                                dateLabel: 'Mars 2025',
                              ),
                              _DashedSeparator(),

                              _TimelineItem(
                                title: 'Quizz de formation audit',
                                status: _Status.valid,
                                dateLabel: 'Mars 2025',
                              ),
                              _DashedSeparator(),
                              _TimelineItem(
                                title: 'Quizz de formation audit',
                                status: _Status.valid,
                                dateLabel: 'Mars 2025',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Container(),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

/* ------------------------- Profile Header ------------------------- */

class _ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String statusText;
  final Color statusColor;
  final String expireText;
  final String avatarUrl;
  // final String actionLabel;
  final bool expanded;
  // final VoidCallback onTapAction;

  const _ProfileHeader({
    required this.name,
    required this.email,
    required this.statusText,
    required this.statusColor,
    required this.expireText,
    required this.avatarUrl,
    // required this.actionLabel,
    required this.expanded,
    // required this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    final textDark = const Color(0xFF1F2937);

    return Column(
      children: [
        // avatar + main info + action
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF4A77CF), width: 3),
                shape: BoxShape.circle,
              ),
              child: avatar(name, radius: 70),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        color: textDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        email,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF6B7280),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Wrap(
                        spacing: 10,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'STATUT : ',
                              children: [
                                TextSpan(
                                  text: statusText,
                                  style: GoogleFonts.roboto(
                                    color: statusColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),

                            style: GoogleFonts.roboto(
                              color: const Color(0xFF6B7280),
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            expireText,
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF6B7280),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // action drop down button (Nouveau)
                    Padding(
                      padding: const EdgeInsets.only(left: 35, top: 10),
                      child: DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        icon: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: Colors.white,
                        ),
                        hint: Text(
                          'Nouveau',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          fillColor: AppColors.primary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'formation',
                            child: const Text('Formation'),
                            onTap: () {
                              context.router.push(
                                const ProfileFormationRoute(),
                              );
                            },
                          ),

                          DropdownMenuItem(
                            value: 'degree',
                            child: const Text('Diplôme'),
                            onTap: () {
                              context.router.push(const ProfileDegreeRoute());
                            },
                          ),
                          DropdownMenuItem(
                            value: 'sensibilization',
                            child: const Text('Sensibilisation'),
                            onTap: () {
                              context.router.push(
                                const ProfileSensibilizationRoute(),
                              );
                            },
                          ),
                          DropdownMenuItem(
                            value: 'entretien',
                            child: const Text('Entretien'),
                            onTap: () {
                              context.router.push(
                                const ProfileEntretienRoute(),
                              );
                            },
                          ),
                          const DropdownMenuItem(
                            value: 'quizz',
                            child: Text('Quizz'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/* ------------------------- Competences Box ------------------------- */

class _CompetencesBox extends StatelessWidget {
  final List<_CompRow> rows;
  final VoidCallback onSeeMore;

  const _CompetencesBox({required this.rows, required this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    final headStyle = GoogleFonts.poppins(
      color: const Color(0xFF1F2937),
      fontWeight: FontWeight.w800,
    );

    return Material(
      color: Colors.white,
      elevation: .5,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          // header bar
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Text('Competences', style: headStyle),
                  const Spacer(),
                  InkWell(
                    onTap: onSeeMore,
                    child: Text(
                      '( Voir plus )',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF4A77CF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // rows
          for (int i = 0; i < rows.length; i++)
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F5FF),
                border: Border(
                  bottom: BorderSide(
                    color: i == rows.length - 1
                        ? Colors.transparent
                        : const Color(0xFFE0E7FF),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        rows[i].title,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: const Color(0xFF344055),
                        ),
                      ),
                    ),
                    Text(
                      'Recommandé',
                      style: GoogleFonts.roboto(
                        fontSize: 11,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CompRow {
  final String title;
  const _CompRow({required this.title});
}

/* ------------------------- Section headers ------------------------- */

class _SectionHeader extends StatelessWidget {
  final IconData emojiIcon;
  final String title;
  const _SectionHeader({required this.emojiIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        const Icon(Icons.star_border_rounded, color: Colors.black87),
        Text(
          title,
          style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 17),
        ),
      ],
    );
  }
}

class _PlainHeader extends StatelessWidget {
  final String title;
  const _PlainHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

/* ------------------------- Blocks & Items ------------------------- */

class _SectionBlock extends StatelessWidget {
  final List<Widget> children;

  const _SectionBlock({required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

enum _Status { valid, expired, notValid }

class _TimelineItem extends StatelessWidget {
  final String title;
  final _Status status;
  final String? dateLabel;

  const _TimelineItem({
    required this.title,
    required this.status,
    required this.dateLabel,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;
    Icon? statusIcon;

    switch (status) {
      case _Status.valid:
        statusColor = const Color(0xFF20B265);
        statusText = 'Validé';
        statusIcon = const Icon(
          Icons.check_circle,
          color: Color(0xFF20B265),
          size: 18,
        );
        break;
      case _Status.expired:
        statusColor = const Color(0xFFE53935);
        statusText = 'Expiré';
        statusIcon = const Icon(
          Icons.block,
          color: Color(0xFFE53935),
          size: 18,
        );
        break;
      case _Status.notValid:
        statusColor = const Color(0xFFE53935);
        statusText = 'Non Valide';
        statusIcon = null;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          // title + status on right
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 8), child: _Bullet()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Text(
                statusText,
                style: GoogleFonts.roboto(
                  color: statusColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          if (dateLabel != null)
            Padding(
              padding: const EdgeInsets.only(left: 26, top: 6),
              child: Row(
                children: [
                  Assets.svgs.calendarDate.svg(),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 8),
                    child: Text(
                      dateLabel!,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF6B7280),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  if (statusIcon != null) statusIcon,
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: Color(0xFF3B6CC8),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _DashedSeparator extends StatelessWidget {
  const _DashedSeparator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 12),
      child: LayoutBuilder(
        builder: (_, c) {
          // draw dashed line
          final dashWidth = 6.0;
          final dashSpace = 4.0;
          final dashes = (c.maxWidth / (dashWidth + dashSpace)).floor();
          return Row(
            children: List.generate(
              dashes,
              (_) => Padding(
                padding: EdgeInsets.only(right: dashSpace),
                child: Container(
                  width: dashWidth,
                  height: 1.2,
                  color: const Color(0xFFC9CED8),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
