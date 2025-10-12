import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/assets.gen.dart';
import '../_commons/route/app_router.gr.dart';
import '../_commons/theming/app_color.dart';
import '../_commons_widgets/my_scaffold.dart';
import 'widgets/formations_sensibilizations_body.dart';

@RoutePage()
class FormationsSensibilizationsPage extends StatelessWidget {
  static const String routeName = '/formations_sensibilizations';
  const FormationsSensibilizationsPage({super.key, this.initialPage = 2});
  final int initialPage; // 1: In progress, 2: Formations, 3: Sensibilizations

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: 'FORMATIONS & SENSIBILISATIONS',
      paddingHorizontale: 0,
      body: Center(
        child: FormationsSensibilizationsBody(initialPage: initialPage),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          context.router.push(const AllCertificationsRoute());
        },
        child: Container(
          width: 120,
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
              Assets.svgs.certificate.svg(),
              Text(
                'Quizz',
                style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
