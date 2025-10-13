import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/formation/detail/formation_detail_bloc.dart';
import '../../../application/formation/formations_bloc.dart';
import '../../../infrastructure/_commons/network/user_session.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../_commons_widgets/my_toast.dart';

class FormationRegistrationSheet extends StatefulWidget {
  final int formationId;
  const FormationRegistrationSheet({super.key, required this.formationId});

  static Future<void> show({
    required BuildContext context,
    required int formationId,
  }) async {
    final bloc = context.read<FormationDetailBloc>();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheetCtx) => BlocProvider.value(
        value: bloc,
        child: FormationRegistrationSheet(formationId: formationId),
      ),
    );
  }

  @override
  State<FormationRegistrationSheet> createState() =>
      _FormationRegistrationSheetState();
}

class _FormationRegistrationSheetState
    extends State<FormationRegistrationSheet> {
  final _formKey = GlobalKey<FormState>();
  final _justificationCtrl = TextEditingController();

  final String _fundedBy = 'company'; // options: company, self
  final String _occupationType = 'free_time'; // options: free_time, work_time

  DateTime _start = DateTime.now().toUtc();
  DateTime _end = DateTime.now().toUtc().add(const Duration(days: 7));

  @override
  void dispose() {
    _justificationCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration.zero),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: _start.toLocal(),
    );
    if (picked != null) {
      setState(() {
        _start = DateTime.utc(picked.year, picked.month, picked.day);
        if (_end.isBefore(_start)) {
          _end = _start.add(const Duration(days: 7));
        }
      });
    }
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: _start.toLocal(),
      lastDate: DateTime.now().add(const Duration(days: 730)),
      initialDate: _end.toLocal(),
    );
    if (picked != null) {
      setState(() {
        _end = DateTime.utc(picked.year, picked.month, picked.day);
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final user = await myUserSession.getAuthenticatedUser();
    if (user == null) {
      errorToast(context: context, msg: 'Utilisateur non authentifié');
      return;
    }
    final String justification = _justificationCtrl.text.trim();
    if (justification.isEmpty) {
      errorToast(context: context, msg: 'La justification est requise');
      return;
    }
    final body = {
      'formation_id': widget.formationId,
      'registration_type': 'individual',
      'justification': justification,
      'start_date': _start.toIso8601String(),
      'end_date': _end.toIso8601String(),
      'cost': 0,
      'funded_by': _fundedBy,
      'occupation_type': _occupationType,
      'user_ids': [user.id],
    };

    context.read<FormationDetailBloc>().add(
      FormationDetailEvent.registerRequested(body: body),
    );
  }

  @override
  Widget build(BuildContext context) {
    final txt = GoogleFonts.poppins(fontSize: 14.5);
    final label = GoogleFonts.poppins(fontWeight: FontWeight.w600);

    return BlocListener<FormationDetailBloc, FormationDetailState>(
      listenWhen: (p, c) => p.registerResultOption != c.registerResultOption,
      listener: (context, state) {
        state.registerResultOption.fold(
          () {},
          (either) => either.fold(
            (l) => errorFailureHandle(context: context, failure: l),
            (_) {
              successToast(
                context: context,
                msg: 'Inscription créée avec succès',
              );
              context.read<FormationsBloc>()
                ..add(const FormationsEvent.fetchMyFormationsRequested())
                ..add(const FormationsEvent.fetchRequested());

              Navigator.of(context).maybePop();
            },
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 48,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                Text(
                  'Inscription à la formation',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),

                // Justification
                Text('Justification', style: label),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _justificationCtrl,
                  maxLines: 4,
                  style: txt,
                  decoration: const InputDecoration(
                    hintText: 'Entrez votre justification',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'La justification est requise'
                      : null,
                ),
                const SizedBox(height: 14),

                // Dates
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date de début', style: label),
                          const SizedBox(height: 6),
                          OutlinedButton(
                            onPressed: _pickStartDate,
                            child: Text(
                              _start.toLocal().toString().split('.').first,
                              style: txt,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date de fin', style: label),
                          const SizedBox(height: 6),
                          OutlinedButton(
                            onPressed: _pickEndDate,
                            child: Text(
                              _end.toLocal().toString().split('.').first,
                              style: txt,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                const SizedBox(height: 14),

                // Funded by
                // Text('Financé par', style: label),
                // const SizedBox(height: 6),
                // DropdownButtonFormField<String>(
                //   value: _fundedBy,
                //   items: const [
                //     DropdownMenuItem(
                //       value: 'company',
                //       child: Text('Entreprise'),
                //     ),
                //     DropdownMenuItem(value: 'self', child: Text('Personnel')),
                //   ],
                //   onChanged: (v) => setState(() => _fundedBy = v ?? 'company'),
                // ),
                // const SizedBox(height: 14),

                // Occupation type
                // Text('Type d’occupation', style: label),
                // const SizedBox(height: 6),
                // DropdownButtonFormField<String>(
                //   value: _occupationType,
                //   items: const [
                //     DropdownMenuItem(
                //       value: 'free_time',
                //       child: Text('Temps libre'),
                //     ),
                //     DropdownMenuItem(
                //       value: 'work_time',
                //       child: Text('Temps de travail'),
                //     ),
                //   ],
                //   onChanged: (v) =>
                //       setState(() => _occupationType = v ?? 'free_time'),
                // ),
                // const SizedBox(height: 20),
                BlocBuilder<FormationDetailBloc, FormationDetailState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.isRegistering ? null : _submit,
                        child: state.isRegistering
                            ? const LoadingWidget(
                                width: 18,
                                height: 18,
                                color: Colors.white,
                              )
                            : Text(
                                "S'inscrire",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
