import 'package:flutter/widgets.dart';

class AdaptiveAction {
  final Widget? child;
  final IconData? icon;
  final String? title;
  final void Function() onPressed;
  final String? tooltip;
  final bool showTitle;

  const AdaptiveAction({
    this.child,
    this.icon,
    required this.title,
    required this.onPressed,
    this.tooltip,
    this.showTitle = false,
  }) : assert(
          child != null || icon != null,
          'Either child or icon must be defined',
        );
}
