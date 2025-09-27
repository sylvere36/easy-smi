import 'dart:math';
import 'package:flutter/material.dart';

/// Liste paginée générique.
/// - Passe-lui tes items, les flags (isInitialLoading / isLoadingMore / isLastPage),
///   et des callbacks pour charger plus et rafraîchir.
/// - Tu peux l'utiliser avec n'importe quel BLoC.
class PagedList<T> extends StatefulWidget {
  const PagedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onLoadMore,
    this.onRefresh,
    this.isInitialLoading = false,
    this.isLoadingMore = false,
    this.isLastPage = false,
    this.padding = const EdgeInsets.all(16),
    this.separatorBuilder,
    this.scrollController,
    this.bottomSpace = 24,
    this.triggerThreshold = 0.80, // 80% de scroll
    this.empty,
  });

  final List<T> items;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  /// Dispatch vers ton bloc: e.g. `() => context.read<EventBloc>().add(FetchNext())`
  final VoidCallback onLoadMore;

  /// Pull-to-refresh optionnel: e.g. `() async => context.read<EventBloc>().add(Refresh())`
  final Future<void> Function()? onRefresh;

  final bool isInitialLoading;
  final bool isLoadingMore;
  final bool isLastPage;

  final EdgeInsets padding;
  final IndexedWidgetBuilder? separatorBuilder;
  final ScrollController? scrollController;
  final double bottomSpace;
  final double triggerThreshold; // 0..1
  final Widget? empty;

  @override
  State<PagedList<T>> createState() => _PagedListState<T>();
}

class _PagedListState<T> extends State<PagedList<T>> {
  late final ScrollController _ctrl =
      widget.scrollController ?? ScrollController();

  // Petite barrière pour éviter les multiples dispatch rapides (debounce simple)
  bool _gate = false;

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(_onScroll);

    // Si la liste initiale est trop courte pour scroller, tente un fetch après le premier frame.
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeAskMore());
  }

  @override
  void didUpdateWidget(covariant PagedList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Réouvre la barrière quand le bloc a fini de charger
    if (oldWidget.isLoadingMore && !widget.isLoadingMore) {
      _gate = false;
      // Si la nouvelle page est encore trop courte, tente encore
      WidgetsBinding.instance.addPostFrameCallback((_) => _maybeAskMore());
    }
  }

  void _onScroll() {
    if (!_ctrl.hasClients) return;
    final m = _ctrl.position;
    final triggerAt = max(0.0, m.maxScrollExtent * widget.triggerThreshold);

    if (m.pixels >= triggerAt) _maybeAskMore();
  }

  void _maybeAskMore() {
    final canAsk =
        !_gate &&
        !widget.isLastPage &&
        !widget.isLoadingMore &&
        !widget.isInitialLoading;

    if (!canAsk) return;

    // Si on ne peut pas scroller (contenu < viewport), on demande aussi
    final needBecauseShort =
        !_ctrl.hasClients || (_ctrl.position.maxScrollExtent <= 0);

    if (needBecauseShort || _nearBottom()) {
      _gate = true; // ferme la barrière jusqu’à la fin du chargement
      widget.onLoadMore();
    }
  }

  bool _nearBottom() {
    if (!_ctrl.hasClients) return true;
    final m = _ctrl.position;
    return m.pixels >= m.maxScrollExtent * widget.triggerThreshold;
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _ctrl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isInitialLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (widget.items.isEmpty) {
      return widget.empty ??
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Aucun élément',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
    }

    final list = ListView.separated(
      controller: _ctrl,
      padding: widget.padding.copyWith(
        bottom: widget.padding.bottom + widget.bottomSpace,
      ),
      itemCount: widget.items.length + 1, // +1 pour le footer
      separatorBuilder:
          widget.separatorBuilder ?? (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == widget.items.length) return _buildFooter(context);
        final item = widget.items[index];
        return widget.itemBuilder(context, index, item);
      },
    );

    return widget.onRefresh != null
        ? RefreshIndicator(onRefresh: widget.onRefresh!, child: list)
        : list;
  }

  Widget _buildFooter(BuildContext context) {
    if (widget.isLoadingMore) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (widget.isLastPage) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            'Fin de liste',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ),
      );
    }
    // Rien (mais on garde l’espace bas)
    return const SizedBox(height: 0);
  }
}
