import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../application/communication/notifications_bloc.dart';
import '../../domain/communication/models/notification.dart';
import '../_commons/helpers/html_view.dart';
import '../_commons_widgets/my_scaffold.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  static const String routeName = '/notifications';
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    // initial fetch
    context.read<NotificationsBloc>().add(
      const NotificationsEvent.fetchRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'Notifications',
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          if (state.isLoading && state.items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.items.isEmpty) {
            return const Center(child: Text('Aucune notification'));
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<NotificationsBloc>().add(
                const NotificationsEvent.refreshRequested(),
              );
            },
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              itemBuilder: (context, index) {
                final item = state.items[index];
                return _NotificationCard(
                  item: item,
                  onTap: () async {
                    if (item.isUnread) {
                      context.read<NotificationsBloc>().add(
                        NotificationsEvent.markAsReadRequested(id: item.id),
                      );
                    }
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      builder: (_) => _NotificationDetailSheet(item: item),
                    );
                  },
                );
              },
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemCount: state.items.length,
            ),
          );
        },
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback onTap;
  const _NotificationCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bg = item.isUnread
        ? Colors.blue.withValues(alpha: 0.06)
        : Colors.white;
    final border = item.isUnread
        ? Colors.blue.withValues(alpha: 0.3)
        : Colors.grey.shade200;
    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(left: BorderSide(color: border, width: 3)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Avatar(initials: item.initials, highlight: item.isPriority),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.object,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: item.isUnread
                                  ? FontWeight.w700
                                  : FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          item.humanDate,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.senderName ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String initials;
  final bool highlight;
  const _Avatar({required this.initials, required this.highlight});
  @override
  Widget build(BuildContext context) {
    final Color color = highlight ? Colors.orange : Colors.blueGrey;
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: GoogleFonts.poppins(color: color, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _NotificationDetailSheet extends StatelessWidget {
  final NotificationItem item;
  const _NotificationDetailSheet({required this.item});

  @override
  Widget build(BuildContext context) {
    final String html = item.htmlContent ?? '<p>Aucun contenu</p>';
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _Avatar(initials: item.initials, highlight: item.isPriority),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.senderName ?? 'Système',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          item.humanDate,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                item.object,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(child: HtmlView(html: html)),
            ],
          ),
        );
      },
    );
  }
}
