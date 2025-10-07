import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/assets.gen.dart';
import '../../../injection_container.dart';
import '../../application/permit/detail/permit_detail_bloc.dart';
import '../../domain/permit/models/permit_item.dart';
import '../../domain/permit/models/permit_risk_assessment_request.dart';
import '../../infrastructure/_commons/network/user_session.dart';
import '../_commons/route/app_router.gr.dart';
import '../_commons/theming/app_color.dart';
import '../_commons/theming/app_size.dart';
import '../_commons_widgets/loading_widget.dart';
import '../_commons_widgets/my_scaffold.dart';
import '../_commons_widgets/my_toast.dart';
import 'widgets/evidence_galerry.dart';

@RoutePage()
class RiskAssessmentResultPage extends StatefulWidget {
  static const String routeName = '/risk-assessment-result';
  final List<PermitRiskAssessmentQuestionInput> responses;
  final PermitItem permit;
  const RiskAssessmentResultPage({
    super.key,
    required this.responses,
    required this.permit,
  });

  @override
  State<RiskAssessmentResultPage> createState() =>
      _RiskAssessmentResultPageState();
}

class _RiskAssessmentResultPageState extends State<RiskAssessmentResultPage> {
  final TextEditingController _ctrl = TextEditingController();
  String status = '';
  int evaluatorId = 1; //

  @override
  void initState() {
    super.initState();
    initEvaluator();
  }

  void initEvaluator() {
    myUserSession.getAuthenticatedUser().then((user) {
      if (user != null) {
        setState(() {
          evaluatorId = user.id;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PermitDetailBloc>(),
      child: BlocBuilder<PermitDetailBloc, PermitDetailState>(
        builder: (context, state) {
          return MyScaffold(
            appBarTitle: 'RESULTAT',
            body: SingleChildScrollView(
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget.responses.asMap().entries.map(
                    (e) => ResponseWidget(
                      response: e.value,
                      index: e.key + 1,
                      onEdit: () {
                        // navigate to risk assessment page with initial data
                        context.router.popAndPush(
                          RiskAssessmentRoute(
                            permit: widget.permit,
                            initialAnswers: widget.responses,
                            initialIndex: e.key,
                          ),
                        );
                      },
                    ),
                  ),
                  const Text(
                    'Résultat',
                    style: TextStyle(color: AppColors.titleGrey),
                  ),
                  // Dropdown with options: Conforme, Non Conforme, Non Applicable
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      value: 'Non Conforme',
                      items: ['Conforme', 'Non Conforme', 'Non Applicable']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            // update status
                            // ignore: prefer_typing_uninitialized_variables
                            status = value;
                          });
                        }
                      },
                    ),
                  ),
                  const Text(
                    'Commentaire',
                    style: TextStyle(color: AppColors.titleGrey),
                  ),

                  TextField(
                    controller: _ctrl,
                    minLines: 3,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Ecrire  un commentaire',
                      hintStyle: GoogleFonts.poppins(color: AppColors.sub),
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                    ),
                    style: GoogleFonts.poppins(),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgDark,
                        minimumSize: const Size.fromHeight(44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_ctrl.text.isEmpty) {
                          errorToast(
                            context: context,
                            msg: 'Veuillez entrer un commentaire',
                          );
                          return;
                        }

                        BlocProvider.of<PermitDetailBloc>(context).add(
                          PermitDetailEvent.riskAssessmentSubmitted(
                            request: PermitRiskAssessmentRequest(
                              id: widget.permit.id,
                              workPermitId: widget.permit.id,
                              evaluatorId: evaluatorId,
                              questions: widget.responses,
                              status: status,
                              conclusion: _ctrl.text,
                            ),
                          ),
                        );
                      },

                      child: state.isSubmittingRiskAssessment
                          ? const LoadingWidget(
                              height: 10,
                              width: 10,
                              color: Colors.white,
                            )
                          : Text(
                              'Enregistrer',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ResponseWidget extends StatelessWidget {
  final PermitRiskAssessmentQuestionInput response;
  final int index;
  final Function onEdit;
  const ResponseWidget({
    super.key,
    required this.response,
    required this.index,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: 10,
              children: [
                Text(
                  'Question $index',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.getSize(
                      context: context,
                      mobileValue: 18,
                    ),
                  ),
                ),
                Text(
                  response.response ? 'Conforme' : 'Non Confirmité détectée',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.getSize(
                      context: context,
                      mobileValue: 18,
                    ),
                    color: response.response ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),

            IconButton(
              onPressed: () {
                onEdit();
              },
              icon: Assets.svgs.pen.svg(),
            ),
          ],
        ),
        Wrap(
          spacing: 10,
          children: [
            Text(
              response.questionTitle,
              style: TextStyle(
                fontSize: AppSize.getSize(context: context, mobileValue: 16),
              ),
            ),
            Text(
              response.response ? 'OUI' : ' NON',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSize.getSize(context: context, mobileValue: 16),
              ),
            ),
          ],
        ),

        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 4),
          child: Row(
            children: [
              Icon(Icons.note_alt, size: 16),
              Text(
                'Votre Commentaire',
                style: TextStyle(color: AppColors.titleGrey),
              ),
            ],
          ),
        ),
        Text(response.comment),

        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Preuves associées',
            style: TextStyle(color: AppColors.titleGrey),
          ),
        ),

        if (response.evidences.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: EvidenceGallery(paths: response.evidences),
          ),

        const Divider(),
      ],
    );
  }
}
