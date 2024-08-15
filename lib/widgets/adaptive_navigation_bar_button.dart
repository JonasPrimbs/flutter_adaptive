import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/cupertino.dart' as cupertino_ui;
import 'package:flutter/material.dart' as material_ui;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart' as macos_ui;

import '../adaptive.dart';

Widget adaptiveNavigationBarButton({
  required void Function() onPressed,
  String? label,
  IconData? icon,
  Widget? child,
}) {
  return adaptive(
    material: () => material_ui.IconButton(
      onPressed: onPressed,
      tooltip: label,
      icon: child ?? Icon(icon),
    ),
    cupertino: () => cupertino_ui.CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: child ??
          Icon(
            icon,
            size: 24.0,
          ),
    ),
    macos: () => macos_ui.MacosIconButton(
      onPressed: onPressed,
      icon: child ?? macos_ui.MacosIcon(icon),
    ),
    fluent: () => fluent_ui.IconButton(
      onPressed: onPressed,
      icon: child ?? fluent_ui.Icon(icon),
    ),
  );
}
