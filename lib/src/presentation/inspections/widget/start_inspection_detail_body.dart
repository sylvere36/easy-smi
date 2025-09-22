import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';

class StartInspectionDetailBody extends StatelessWidget {
  const StartInspectionDetailBody({
    super.key,
    required this.title,
    required this.site,
    required this.mission,
    required this.persons,
    required this.description,
    this.onEdit,
    this.onContinue,
  });

  final String title;
  final String site;
  final String mission;
  final List<String> persons;
  final String description;
  final VoidCallback? onEdit;
  final VoidCallback? onContinue;

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF1666E1);
    final handleColor = const Color(0xFF2EA0FF);
    final labelColor = const Color(0xFF666A70);
    final valueColor = const Color(0xFF0E0F14);

    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        backgroundColor: blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        titleSpacing: 0,
        title: Text(
          title.toUpperCase(),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.ubuntu(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          // white sheet with rounded top
          Padding(
            // pushes the sheet just below the curved appbar area
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  // little handle under appbar
                  Padding(
                    padding: const EdgeInsets.only(top: 14, bottom: 8),
                    child: Container(
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        color: handleColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  // content
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
                      children: [
                        // Header "Informations" + pencil
                        Row(
                          children: [
                            Text(
                              'Informations',
                              style: GoogleFonts.nunito(
                                color: valueColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            InkWell(
                              onTap: onEdit,
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Assets.svgs.pen.svg(),
                              ),
                            ),
                          ],
                        ),

                        // Site
                        _Section(
                          icon: Icons.place_rounded,
                          label: 'Site d’inspections',
                          value: site,
                          labelColor: labelColor,
                          valueColor: valueColor,
                        ),

                        // Mission
                        _Section(
                          icon: Icons.description_rounded,
                          label: 'Mission de control',
                          value: mission,
                          multiline: true,
                          labelColor: labelColor,
                          valueColor: valueColor,
                        ),

                        // Persons
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _CircleIcon(icon: Icons.person_rounded),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Personne(s) concernée(s)',
                                        style: TextStyle(
                                          color: labelColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: persons
                                              .map(
                                                (p) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        bottom: 6,
                                                      ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                              top: 9,
                                                            ),
                                                        child: Icon(
                                                          Icons.circle,
                                                          size: 8,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                left: 10,
                                                              ),
                                                          child: Text(
                                                            p,
                                                            style: TextStyle(
                                                              color: valueColor,
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 1.15,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Description
                        _Section(
                          icon: Icons.article_rounded,
                          label: 'Description',
                          value: description,
                          labelColor: labelColor,
                          valueColor: valueColor,
                          multiline: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom gradient button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onContinue,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2F6BEA), Color(0xFF2EB3F3)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'CONTINUER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ----------------- Pieces réutilisables ----------------- */

class _Section extends StatelessWidget {
  const _Section({
    required this.icon,
    required this.label,
    required this.value,
    required this.labelColor,
    required this.valueColor,
    this.multiline = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color labelColor;
  final Color valueColor;
  final bool multiline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CircleIcon(icon: icon),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: GoogleFonts.ubuntu(
                          color: labelColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              value,
              maxLines: multiline ? null : 2,
              overflow: multiline
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: GoogleFonts.nunito(
                color: valueColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  const _CircleIcon({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.black54,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}
