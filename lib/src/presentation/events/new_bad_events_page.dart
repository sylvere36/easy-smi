import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../application/events/detail/event_detail_bloc.dart';
import '../../application/events/events_bloc.dart';
import '../../domain/event/models/event_item.dart';
import '../_commons/route/app_router.gr.dart';
import '../_commons/theming/app_color.dart';
import '../_commons_widgets/my_scaffold.dart';
import '../_commons_widgets/paged_list_widget.dart';
import 'widgets/event_card.dart';

@RoutePage()
class NewBadEventsPage extends StatelessWidget {
  static const String routeName = '/new-bad-events';
  const NewBadEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'NOUVEL EVENEMENT NON DESIRABLE',
      paddingHorizontale: 0,
      body: BlocBuilder<EventsBloc, EventsState>(
        builder: (contextE, state) {
          return PagedList<EventItem>(
            items: state.items ?? [], // List<EventItem>
            isInitialLoading: state.isLoading && state.items == null, // bool
            isLoadingMore: state.isLoading && state.items != null, // bool
            isLastPage: state.canLoadMore, // bool
            onLoadMore: () => context.read<EventsBloc>().add(
              const EventsEvent.fetchNextPage(),
            ),
            onRefresh: () async {
              context.read<EventsBloc>().add(const EventsEvent.reset());
              context.read<EventsBloc>().add(const EventsEvent.fetch());
            },
            itemBuilder: (ctx, i, event) => EventCard(
              onTap: () {
                context.read<EventDetailsBloc>().add(
                  EventDetailsEvent.getEvent(event: event),
                );
              },
              imageUrl: event.attachments.isEmpty
                  ? null
                  : event.attachments.first,
              level: event.humanGravity,
              status: event.humanStatus,
              title: event.title,
              site: event.site,
            ),
            empty: const SizedBox.shrink(),
          );
        },
      ),

      floatingActionButton: GestureDetector(
        onTap: () {
          context.router.push(const AddNewBadEventsRoute());
        },
        child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.note_rounded, color: Colors.white, size: 25),
              Text(
                'Declarer',
                style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
