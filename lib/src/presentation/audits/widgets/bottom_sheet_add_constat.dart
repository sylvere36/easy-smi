import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/audit/detail/audit_detail_bloc.dart';
import '../../../domain/_commons/global_failure.dart';
import '../../_commons/theming/app_color.dart';

Future<void> showAddConstatSheet(
  BuildContext context, {
  required int auditId,
  AuditDetailBloc? auditBloc,
}) async {
  final libelle = TextEditingController();
  final desc = TextEditingController();
  List<String> mediaPaths = [];

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
    ),
    builder: (ctx) {
      final blue = AppColors.primary;
      final providedBloc = auditBloc ?? context.read<AuditDetailBloc>();
      return BlocProvider.value(
        value: providedBloc,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 18,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: BlocListener<AuditDetailBloc, AuditDetailState>(
            listenWhen: (prev, curr) =>
                prev.addObservationResultOption !=
                curr.addObservationResultOption,
            listener: (context, state) {
              state.addObservationResultOption.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    final msg = failure.customMap<String>(
                      serverError: (e) => e.errorText ?? 'Erreur serveur',
                      unauthorized: (e) => e.errorText,
                      noNetwork: (_) => 'Pas de connexion',
                    );
                    ScaffoldMessenger.of(
                      ctx,
                    ).showSnackBar(SnackBar(content: Text(msg)));
                  },
                  (_) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      const SnackBar(content: Text('Constat ajouté')),
                    );
                    Navigator.of(ctx).pop();
                  },
                ),
              );
            },
            child: StatefulBuilder(
              builder: (context, setState) {
                final isLoading = context.select<AuditDetailBloc, bool>(
                  (b) => b.state.isAddingObservation,
                );
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 44,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'NOUVEAU CONSTAT',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _Input(
                      title: 'Libelle constat',
                      controller: libelle,
                      hint: 'Libelle de l’audit',
                    ),
                    const SizedBox(height: 12),
                    _Input(
                      title: 'Description du constat',
                      controller: desc,
                      hint: 'Description de l’audit',
                      minLines: 3,
                      maxLines: 6,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Media',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final res = await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                        );
                        if (res != null) {
                          setState(() {
                            mediaPaths = res.files
                                .where((f) => f.path != null)
                                .map((f) => f.path!)
                                .toList();
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FA),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFE6ECF2)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.attach_file, size: 20),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                mediaPaths.isEmpty
                                    ? 'Selectionez media'
                                    : '${mediaPaths.length} fichier(s) sélectionné(s)',
                                style: GoogleFonts.poppins(fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                                final description = desc.text.trim();
                                if (description.isEmpty) {
                                  ScaffoldMessenger.of(ctx).showSnackBar(
                                    const SnackBar(
                                      content: Text('Description requise'),
                                    ),
                                  );
                                  return;
                                }
                                context.read<AuditDetailBloc>().add(
                                  AuditDetailEvent.addObservation(
                                    id: auditId,
                                    description: description,
                                    documents: mediaPaths,
                                  ),
                                );
                              },
                        child: Text(
                          isLoading ? 'Veuillez patienter…' : 'Ajouter',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
}

class _Input extends StatelessWidget {
  const _Input({
    required this.controller,
    required this.hint,
    required this.title,
    this.minLines = 1,
    this.maxLines = 1,
  });
  final TextEditingController controller;
  final String title;
  final String hint;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        TextField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(color: Colors.black38),
            filled: true,
            fillColor: const Color(0xFFF5F7FA),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFE6ECF2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFE6ECF2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFF1565D8),
                width: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
