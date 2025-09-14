import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_commons_widgets/my_scaffold.dart';
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
    return MyScaffold(
      appBarTitle: 'ACTIONS',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            child: TextField(
              controller: _search,
              // onChanged: (_) => setState(() {}),
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

          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 15,
                children: [
                  ActionCard(
                    badgeText: 'En retard · il y a 1 semaine',
                    badgeColor: Colors.red,
                    title:
                        'Renforcement du control qualité dans le departement departement Gestion Produits',
                    status: 'Brouillon',
                    owner: 'Adeline AITCHEVI',
                    inProgress: false,
                    unreadBubble: 3,
                  ),
                  ActionCard(
                    badgeText: 'Échéance · Dans 1 semaine',
                    badgeColor: Color(0xFF00A651),
                    title:
                        'Renforcement du control qualité dans le departement Gestion Produits',
                    status: 'En cours',
                    owner: 'Arielle BABATON',
                    unreadBubble: 1,
                  ),
                  ActionCard(
                    badgeText: 'Échéance · Dans 1 semaine',
                    badgeColor: Color(0xFF00A651),
                    title:
                        'Renforcement du control qualité dans le departement Gestion Produits',
                    status: 'En cours',
                    owner: 'Arielle BABATON',
                  ),

                  ActionCard(
                    badgeText: 'En retard · il y a 1 semaine',
                    badgeColor: Colors.red,
                    title:
                        'Renforcement du control qualité dans le departement departement Gestion Produits',
                    status: 'Brouillon',
                    owner: 'Adeline AITCHEVI',
                    inProgress: false,
                    unreadBubble: 3,
                  ),
                  ActionCard(
                    badgeText: 'Échéance · Dans 1 semaine',
                    badgeColor: Color(0xFF00A651),
                    title:
                        'Renforcement du control qualité dans le departement Gestion Produits',
                    status: 'En cours',
                    owner: 'Arielle BABATON',
                    unreadBubble: 1,
                  ),
                  ActionCard(
                    badgeText: 'Échéance · Dans 1 semaine',
                    badgeColor: Color(0xFF00A651),
                    title:
                        'Renforcement du control qualité dans le departement Gestion Produits',
                    status: 'En cours',
                    owner: 'Arielle BABATON',
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
