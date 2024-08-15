import 'package:flutter/widgets.dart';

class AdaptiveSidebar {
  final double minWidth;
  final double maxWidth;
  final double initialWidth;
  final bool isResizable;
  final Widget Function(
    BuildContext context,
    ScrollController scrollController,
  ) builder;
  final Widget? titleBar;
  final Widget? footer;

  const AdaptiveSidebar({
    this.minWidth = 200.0,
    this.initialWidth = 250.0,
    this.maxWidth = 400.0,
    this.isResizable = true,
    this.titleBar,
    this.footer,
    required this.builder,
  });
}
