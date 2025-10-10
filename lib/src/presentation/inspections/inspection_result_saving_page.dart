import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../injection_container.dart';
import '../../application/inspection/detail/inspection_detail_bloc.dart';
import '../../domain/inspection/models/inspection_answers_post.dart';
import '../_commons_widgets/loading_widget.dart';
import '../_commons_widgets/my_scaffold.dart';
import '../_commons_widgets/my_toast.dart';

@RoutePage()
class InspectionResultSavingPage extends StatelessWidget {
  static const String routeName = '/inspection-result-saving';
  final InspectionAnswersPostBody answers;
  final int inspectionId;
  final int inspectionFormId;
  const InspectionResultSavingPage({
    super.key,
    required this.answers,
    required this.inspectionId,
    required this.inspectionFormId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<InspectionDetailBloc>()
            ..add(InspectionDetailEvent.fetch(id: inspectionId)),
      child: BlocConsumer<InspectionDetailBloc, InspectionDetailState>(
        listener: (context, state) {
          if (state.remarkIsPosted == true) {
            successToast(
              context: context,
              msg: 'Réponses enregistrées avec succès',
            );
            AutoRouter.of(context).popUntilRoot();
          }
        },
        builder: (context, state) {
          return MyScaffold(
            appBarTitle: 'RESULTAT DE L\'INSPECTION',
            paddingHorizontale: 0,
            body: state.item == null
                ? const Center(child: LoadingWidget())
                : ResultNotesBody(
                    headerText: state.item?.mission ?? 'Inspection sans nom',
                    onSaveDraft: () {},
                    isLoading: state.isLoading,
                    onSend: (remarks, recommendations) {
                      if (remarks == null || recommendations == null) {
                        errorToast(
                          context: context,
                          msg: 'Veuillez remplir tous les champs',
                        );
                        return;
                      }
                      BlocProvider.of<InspectionDetailBloc>(context).add(
                        InspectionDetailEvent.postAnswers(
                          id: inspectionId,
                          body: answers,
                        ),
                      );
                      // ..add(
                      //   InspectionDetailEvent.addRemark(
                      //     id: inspectionId,
                      //     otherRemark: remarks,
                      //     recommendation: recommendations,
                      //   ),
                      // );
                    },
                  ),
          );
        },
      ),
    );
  }
}

class ResultNotesBody extends StatefulWidget {
  const ResultNotesBody({
    super.key,
    required this.headerText,
    this.onSaveDraft,
    this.onSend,
    this.isLoading = false,
  });

  final String headerText;
  final VoidCallback? onSaveDraft;
  final Function(String?, String?)? onSend;
  final bool isLoading;

  @override
  State<ResultNotesBody> createState() => _ResultNotesBodyState();
}

class _ResultNotesBodyState extends State<ResultNotesBody> {
  final _remarksCtrl = TextEditingController(); // Autre remarque
  final _recommendCtrl = TextEditingController(); // Recommendations

  @override
  void dispose() {
    _remarksCtrl.dispose();
    _recommendCtrl.dispose();
    super.dispose();
  }

  // ---- small theme helpers
  static const _navy = Color(0xFF0E1B3D);
  static const _cardShadow = BoxShadow(
    color: Color(0x1F000000),
    blurRadius: 18,
    spreadRadius: -6,
    offset: Offset(0, 10),
  );

  InputDecoration _boxDecoration(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.roboto(
      color: const Color(0xFFB9C1CC),
      fontSize: 15,
      fontWeight: FontWeight.normal,
    ),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F8FE),
      child: CustomScrollView(
        slivers: [
          // ---- header pill
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 22,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [_cardShadow],
                ),
                child: Text(
                  widget.headerText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

          // ---- "Autre remarque"
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Autre remarque',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF3B4A62),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [_cardShadow],
                    ),
                    child: TextField(
                      controller: _remarksCtrl,
                      minLines: 8,
                      maxLines: 12,
                      keyboardType: TextInputType.multiline,
                      decoration: _boxDecoration('Ecrire un texte'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ---- "Recommendations"
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Recommendations',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF3B4A62),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [_cardShadow],
                    ),
                    child: TextField(
                      controller: _recommendCtrl,
                      minLines: 8,
                      maxLines: 12,
                      keyboardType: TextInputType.multiline,
                      decoration: _boxDecoration('Ecrire un texte'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ---- bottom actions
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Row(
                children: [
                  // Draft button
                  // Expanded(
                  //   child: TextButton(
                  //     style: TextButton.styleFrom(
                  //       padding: const EdgeInsets.symmetric(vertical: 18),
                  //       foregroundColor: _navy,
                  //       textStyle: GoogleFonts.inter(
                  //         fontSize: 17,
                  //         fontWeight: FontWeight.w700,
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       FocusScope.of(context).unfocus();
                  //       widget.onSaveDraft?.call();
                  //       context.pop();
                  //       context.pop();
                  //       context.pop();
                  //       context.pop();
                  //       context.pop();
                  //     },
                  //     child: const Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Text('Enregistrer brouillon'),
                  //     ),
                  //   ),
                  // ),

                  // Send button
                  Expanded(
                    child: widget.isLoading == true
                        ? const Center(child: LoadingWidget())
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _navy,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                textStyle: GoogleFonts.inter(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_remarksCtrl.text.isEmpty ||
                                    _recommendCtrl.text.isEmpty) {
                                  // Call the onSend callback with remarks and recommendations
                                  errorToast(
                                    context: context,
                                    msg: 'Veuillez remplir tous les champs',
                                  );
                                  return;
                                }
                                widget.onSend?.call(
                                  _remarksCtrl.text,
                                  _recommendCtrl.text,
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Envoyer'),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Icon(Icons.send_rounded, size: 26),
                                  ),
                                ],
                              ),
                            ),
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
