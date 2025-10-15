import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../application/inspection/detail/inspection_detail_bloc.dart';
import '../../../application/inspection/inspections_bloc.dart';
import '../../../application/organization/organization_bloc.dart';
import '../../../domain/_commons/global_failure.dart';
import '../../../domain/inspection/models/inspection_form_detail.dart';
import '../../../domain/inspection/models/zone.dart';
import '../../../domain/organization/models/organization_user.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons_widgets/my_toast.dart';

class InspectionCreateSheet extends StatefulWidget {
  const InspectionCreateSheet({super.key, required this.formDetail});
  final InspectionFormDetail formDetail;

  @override
  State<InspectionCreateSheet> createState() => _InspectionCreateSheetState();
}

class _InspectionCreateSheetState extends State<InspectionCreateSheet> {
  final _missionCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();

  final Set<int> _selectedZoneIds = {};
  final Set<int> _selectedUserIds = {};

  @override
  void initState() {
    super.initState();
    // Prefill from form detail
    final d = widget.formDetail;
    _missionCtrl.text = d.description ?? '';
    _descriptionCtrl.text = d.description ?? '';
    _selectedZoneIds.addAll(d.zones.map((z) => z.id));
    _selectedUserIds.addAll(d.responsibles.map((u) => u.id));
  }

  @override
  void dispose() {
    _missionCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  // Selection now handled via modal picker; inline setState used in callbacks

  Future<void> _submit() async {
    final form = widget.formDetail;
    if (_selectedZoneIds.isEmpty || _selectedUserIds.isEmpty) {
      errorToast(
        context: context,
        msg: 'Veuillez sélectionner au moins un site et un intervenant.',
      );

      return;
    }
    context.read<InspectionsBloc>().add(
      InspectionsEvent.createRequested(
        inspectionFormId: form.id,
        siteIds: _selectedZoneIds.toList(),
        mission: _missionCtrl.text.trim(),
        inspectorIds: _selectedUserIds.toList(),
        description: _descriptionCtrl.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InspectionDetailBloc>(
          create: (context) =>
              sl<InspectionDetailBloc>()
                ..add(const InspectionDetailEvent.fetchZones()),
        ),
        BlocProvider<OrganizationBloc>(
          create: (context) =>
              sl<OrganizationBloc>()..add(const OrganizationEvent.fetchUsers()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<InspectionsBloc, InspectionsState>(
            listenWhen: (p, n) =>
                p.isCreating != n.isCreating ||
                p.createResultOption != n.createResultOption,
            listener: (context, state) {
              state.createResultOption.fold(
                () {},
                (either) => either.fold(
                  (l) {
                    final msg = l.customMap(
                      serverError: (e) => e.errorText ?? 'Erreur serveur',
                      unauthorized: (_) => 'Non autorisé',
                      noNetwork: (_) => 'Pas de connexion',
                    );
                    errorToast(context: context, msg: msg);
                  },
                  (detail) {
                    successToast(context: context, msg: 'Inspection créée');

                    context.router.maybePop();
                    AutoRouter.of(context).pushAndPopUntil(
                      StartInspectionDetailRoute(
                        inspectionFormId: detail.inspectionFormId,
                        inspectionId: detail.id,
                      ),
                      predicate: (route) => route.isFirst,
                    );
                  },
                ),
              );
            },
          ),
        ],
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),

                // Card-like section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE7EAF3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: Color(0xFF2B3440),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Informations',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xFF2B3440),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Site d'inspection (multi-select picker style)
                      BlocBuilder<InspectionDetailBloc, InspectionDetailState>(
                        builder: (context, st) {
                          final zones = st.zones;
                          final loading = st.isLoadingZones;
                          return _MultiSelectPickField<ZoneItem>(
                            label: 'Site d\'inspection',
                            placeholder: 'Zone',
                            loading: loading,
                            items: zones,
                            selectedIds: _selectedZoneIds,
                            itemId: (z) => z.id,
                            itemLabel: (z) => z.label,
                            onChanged: (ids) => setState(
                              () => _selectedZoneIds
                                ..clear()
                                ..addAll(ids),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Mission controle
                      const _FieldLabel('Mission controle'),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _missionCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Personne / prestataire (multi-select picker style)
                      BlocBuilder<OrganizationBloc, OrganizationState>(
                        builder: (context, st) {
                          final users = st.users;
                          final loading = st.isLoadingUsers;
                          return _MultiSelectPickField<OrganizationUser>(
                            label:
                                'Personne / prestataire Effectuant le travail',
                            placeholder: 'Sélectionner',
                            loading: loading,
                            items: users,
                            selectedIds: _selectedUserIds,
                            itemId: (u) => u.id,
                            itemLabel: (u) => u.name,
                            onChanged: (ids) => setState(
                              () => _selectedUserIds
                                ..clear()
                                ..addAll(ids),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Description du travail
                      const _FieldLabel('Description du travail'),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _descriptionCtrl,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                BlocBuilder<InspectionsBloc, InspectionsState>(
                  builder: (context, st) {
                    return SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: st.isCreating ? null : _submit,
                        icon: st.isCreating
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.check_circle_outline_rounded),
                        label: Text(
                          st.isCreating ? 'Création...' : 'Créer l\'inspection',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.w600));
  }
}

class _MultiSelectPickField<T> extends StatelessWidget {
  const _MultiSelectPickField({
    required this.label,
    required this.placeholder,
    required this.loading,
    required this.items,
    required this.selectedIds,
    required this.itemId,
    required this.itemLabel,
    required this.onChanged,
  });
  final String label;
  final String placeholder;
  final bool loading;
  final List<T> items;
  final Set<int> selectedIds;
  final int Function(T) itemId;
  final String Function(T) itemLabel;
  final void Function(Set<int>) onChanged;

  @override
  Widget build(BuildContext context) {
    final selectedLabels = <String>[];
    for (final t in items) {
      final id = itemId(t);
      if (selectedIds.contains(id)) selectedLabels.add(itemLabel(t));
    }
    final display = selectedLabels.isEmpty
        ? placeholder
        : selectedLabels.join(', ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(label),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: loading || items.isEmpty
              ? null
              : () async {
                  final result = await _openMultiSelectSheet<T>(
                    context,
                    title: label,
                    items: items,
                    initiallySelected: selectedIds,
                    itemId: itemId,
                    itemLabel: itemLabel,
                  );
                  if (result != null) onChanged(result);
                },
          child: InputDecorator(
            isEmpty: selectedLabels.isEmpty,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
            ),
            child: loading
                ? const SizedBox(
                    height: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  )
                : Text(display, maxLines: 2, overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}

Future<Set<int>?> _openMultiSelectSheet<T>(
  BuildContext context, {
  required String title,
  required List<T> items,
  required Set<int> initiallySelected,
  required int Function(T) itemId,
  required String Function(T) itemLabel,
}) async {
  final tempSelected = {...initiallySelected};
  return showModalBottomSheet<Set<int>>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: 16 + MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                constraints: const BoxConstraints(maxHeight: 380),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE7E7E7)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (_, i) {
                    final t = items[i];
                    final id = itemId(t);
                    final sel = tempSelected.contains(id);
                    return CheckboxListTile(
                      value: sel,
                      onChanged: (v) {
                        if (v == true) {
                          tempSelected.add(id);
                        } else {
                          tempSelected.remove(id);
                        }
                        // rebuild
                        (ctx as Element).markNeedsBuild();
                      },
                      title: Text(itemLabel(t)),
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('Annuler'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => Navigator.of(ctx).pop(tempSelected),
                      child: const Text('Valider'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showInspectionCreateSheet(
  BuildContext context, {
  required InspectionFormDetail formDetail,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: InspectionCreateSheet(formDetail: formDetail),
    ),
  );
}
