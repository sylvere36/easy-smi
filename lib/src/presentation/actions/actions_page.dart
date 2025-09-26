import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../application/actions/actions_bloc.dart';
import '../_commons/theming/app_color.dart';
import '../_commons_widgets/my_scaffold.dart';
import '../_shimmers/action_card_shimmer.dart';
import 'widget/action_card.dart';

@RoutePage()
class ActionsPage extends StatefulWidget {
  static const String routeName = '/actions';
  const ActionsPage({super.key});

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionsBloc, ActionsState>(
      builder: (context, state) {
        return MyScaffold(
          appBarTitle: 'ACTIONS',
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<ActionsBloc>().add(const ActionsEvent.fetch());
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 20),
                  child: TextField(
                    controller: _search,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0E1117),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Recherche',
                      contentPadding: const EdgeInsets.only(top: 12, left: 12),
                      filled: true,
                      fillColor: const Color(0xFFF2F4F7),
                      suffixIcon: const Icon(
                        Icons.search_rounded,
                        color: Color(0xFF9AA0A6),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintStyle: GoogleFonts.nunito(
                        color: const Color(0xFF9AA0A6),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      isCollapsed: true,
                    ),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: state.items == null
                        ? const ActionCardShimmerList()
                        : Column(
                            spacing: 15,
                            children: [
                              ...state.items!.map(
                                (action) => ActionCard(
                                  badgeText: action.echeanceText ?? '',
                                  badgeColor: action.inProgressStatus
                                      ? AppColors.green
                                      : Colors.red,
                                  title: action.justification ?? 'Sans titre',
                                  status: action.humanReadableStatus ?? '',
                                  owner: action.inChargeName ?? 'Non assignée',
                                  inProgress: action.inProgressStatus,
                                  unreadBubble: action.commentsCount ?? 0,
                                  statusColor: action.badgeColor,
                                  action: action,
                                ),
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
