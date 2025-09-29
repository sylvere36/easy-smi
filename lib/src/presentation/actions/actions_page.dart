import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/actions/actions_bloc.dart';
import '../_commons/theming/app_color.dart';
import '../_commons_widgets/empty_widget.dart';
import '../_commons_widgets/my_scaffold.dart';
import '../_commons_widgets/search_field_widget.dart';
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
                  child: SearchFieldWidget(
                    controller: _search,
                    onChanged: (value) {
                      context.read<ActionsBloc>().add(
                        ActionsEvent.searchRequested(query: value),
                      );
                    },
                    onClear: () {
                      _search.text = '';
                      context.read<ActionsBloc>().add(
                        const ActionsEvent.searchRequested(query: ''),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: state.items == null
                        ? const ActionCardShimmerList(count: 7)
                        : Column(
                            spacing: 15,
                            children: [
                              if (_search.text.isNotEmpty &&
                                  state.items!.isEmpty)
                                EmptyWidget.noSearch(),

                              if (_search.text.isEmpty && state.items!.isEmpty)
                                EmptyWidget.noActions(),

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
