import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../_commons/theming/app_color.dart';

/// Widget réutilisable pour afficher un état vide avec icône, titre et message
class EmptyWidget extends StatelessWidget {
  /// Icône à afficher (SVG path ou IconData)
  final dynamic icon;

  /// Titre principal
  final String title;

  /// Message descriptif (optionnel)
  final String? message;

  /// Action principale (optionnel)
  final Widget? action;

  /// Couleur de l'icône
  final Color? iconColor;

  /// Taille de l'icône
  final double iconSize;

  /// Espacement vertical entre les éléments
  final double spacing;

  const EmptyWidget({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.action,
    this.iconColor,
    this.iconSize = 80.0,
    this.spacing = 16.0,
  });

  /// Factory pour un état "Aucune donnée"
  factory EmptyWidget.noData({
    String title = 'Aucune donnée',
    String? message = 'Il n\'y a rien à afficher pour le moment.',
    Widget? action,
  }) {
    return EmptyWidget(
      icon: Icons.inbox_outlined,
      title: title,
      message: message,
      action: action,
      iconColor: AppColors.sub,
    );
  }

  /// Factory pour un état "Aucun résultat"
  factory EmptyWidget.noResults({
    String title = 'Aucun résultat',
    String? message = 'Aucun élément ne correspond à votre recherche.',
    Widget? action,
  }) {
    return EmptyWidget(
      icon: Icons.search_off_outlined,
      title: title,
      message: message,
      action: action,
      iconColor: AppColors.sub,
    );
  }

  /// Factory pour un état "Aucune action"
  factory EmptyWidget.noActions({
    String title = 'Aucune action',
    String? message = 'Aucune action n\'a été créée pour le moment.',
    Widget? action,
  }) {
    return EmptyWidget(
      icon: 'assets/svgs/document.svg',
      title: title,
      message: message,
      action: action,
      iconColor: AppColors.sub,
    );
  }

  /// Factory pour un état "Aucun commentaire"
  factory EmptyWidget.noComments({
    String title = 'Aucun commentaire',
    String? message = 'Soyez le premier à commenter.',
    Widget? action,
  }) {
    return EmptyWidget(
      icon: Icons.chat_bubble_outline,
      title: title,
      message: message,
      action: action,
      iconColor: AppColors.sub,
    );
  }

  /// Factory pour un état "Aucune tâche"
  factory EmptyWidget.noTasks({
    String title = 'Aucune tâche',
    String? message = 'Aucune tâche n\'est associée à cette action.',
    Widget? action,
  }) {
    return EmptyWidget(
      icon: Icons.task_outlined,
      title: title,
      message: message,
      action: action,
      iconColor: AppColors.sub,
    );
  }

  /// Factory pour un état d'erreur
  factory EmptyWidget.error({
    String title = 'Une erreur s\'est produite',
    String? message = 'Impossible de charger les données.',
    Widget? action,
  }) {
    return EmptyWidget(
      icon: Icons.error_outline,
      title: title,
      message: message,
      action: action,
      iconColor: AppColors.error,
    );
  }

  /// Empty Search
  factory EmptyWidget.noSearch({
    String title = 'Aucun résultat',
    String? message = 'Aucun élément ne correspond à votre recherche.',
    Widget? action,
  }) {
    return EmptyWidget(
      icon: Icons.search_off_outlined,
      title: title,
      message: message,
      action: action,
      iconColor: AppColors.sub,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icône
            _buildIcon(),
            SizedBox(height: spacing),

            // Titre
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.dark,
              ),
              textAlign: TextAlign.center,
            ),

            // Message (si fourni)
            if (message != null) ...[
              SizedBox(height: spacing / 2),
              Text(
                message!,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.sub),
                textAlign: TextAlign.center,
              ),
            ],

            // Action (si fournie)
            if (action != null) ...[SizedBox(height: spacing * 1.5), action!],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (icon is String) {
      // SVG asset
      return SvgPicture.asset(
        icon as String,
        width: iconSize,
        height: iconSize,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : null,
      );
    } else if (icon is IconData) {
      // Material Icon
      return Icon(
        icon as IconData,
        size: iconSize,
        color: iconColor ?? AppColors.sub,
      );
    } else {
      // Fallback icon
      return Icon(
        Icons.help_outline,
        size: iconSize,
        color: iconColor ?? AppColors.sub,
      );
    }
  }
}
