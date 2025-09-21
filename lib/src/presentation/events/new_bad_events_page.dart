import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_commons/route/app_router.gr.dart';
import '../_commons/theming/app_color.dart';
import '../_commons_widgets/my_scaffold.dart';
import 'widgets/event_card.dart';

@RoutePage()
class NewBadEventsPage extends StatelessWidget {
  static const String routeName = '/new-bad-events';
  const NewBadEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'NOUVEL EVENEMENT NON DESIRABLE',
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: List.generate(
            8,
            (index) => const EventCard(
              imageUrl: 'https://picsum.photos/seed/ev2/600/320',
              level: 'Majeur',
              status: 'En cours',
              title: 'Entrepôt de stockage, zone de stockage',
              site: 'Espace vert du PAC',
            ),
          ),
        ),
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
