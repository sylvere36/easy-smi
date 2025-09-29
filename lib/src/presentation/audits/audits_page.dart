import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/audit/audits_bloc.dart';
import '../_commons_widgets/empty_widget.dart';
import '../_commons_widgets/my_scaffold.dart';
import '../_shimmers/card_shimmer.dart';
import 'widgets/audits_widget.dart';

@RoutePage()
class AuditsPage extends StatefulWidget {
  static const String routeName = '/audits';
  const AuditsPage({super.key});

  @override
  State<AuditsPage> createState() => _AuditsPageState();
}

class _AuditsPageState extends State<AuditsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuditsBloc, AuditsState>(
      builder: (context, state) {
        return MyScaffold(
          appBarTitle: 'AUDITS',
          body: SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                if (state.isLoading || state.items == null)
                  ...List.generate(6, (index) => const CardShimmer()),
                if (state.items != null && state.items!.isEmpty)
                  EmptyWidget.noData(),
                ...state.items?.map(
                      (e) => AuditCard(
                        tag: e.typeHumanReadable,
                        status: e.statusHumanReadable,
                        title: e.label,
                        process: e.process?.title ?? '---',
                        audit: e,
                      ),
                    ) ??
                    [const SizedBox.shrink()],
              ],
            ),
          ),
        );
      },
    );
  }
}
