import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/join_organization.dart';

@RoutePage()
class JoinOrganisationPage extends StatefulWidget {
  static const String routeName = '/join-organisation';
  const JoinOrganisationPage({super.key});

  @override
  State<JoinOrganisationPage> createState() => _JoinOrganisationPageState();
}

class _JoinOrganisationPageState extends State<JoinOrganisationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: JoinOrganization());
  }
}
