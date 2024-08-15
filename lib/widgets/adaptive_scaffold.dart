import 'package:flutter/cupertino.dart' as cupertino_ui;
import 'package:flutter/material.dart' as material_ui;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart' as macos_ui;
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;

import '../adaptive.dart';
import '../data/data.dart';
import 'adaptive_navigation_bar_button.dart';

Widget adaptivePageScaffold({
  Key? key,
  Widget? title,
  required Widget body,
  AdaptiveAction? primaryAction,
  Iterable<AdaptiveAction>? secondaryActions,
  AdaptiveAction? backAction,
  bool automaticBackButton = true,
}) {
  return adaptive(
    material: () => material_ui.Scaffold(
      key: key,
      appBar: material_ui.AppBar(
        leading: backAction == null
            ? null
            : adaptiveNavigationBarButton(
                onPressed: backAction.onPressed,
                label: backAction.title,
                icon: backAction.icon,
                child: backAction.child,
              ),
        automaticallyImplyLeading: automaticBackButton,
        title: title,
        actions: secondaryActions
            ?.map(
              (action) => adaptiveNavigationBarButton(
                onPressed: action.onPressed,
                label: action.title,
                icon: action.icon,
                child: action.child,
              ),
            )
            .toList(),
      ),
      body: body,
      floatingActionButton: primaryAction == null
          ? null
          : material_ui.FloatingActionButton.extended(
              onPressed: primaryAction.onPressed,
              label: Text(primaryAction.title ?? ''),
              tooltip: primaryAction.tooltip,
              isExtended: primaryAction.showTitle,
              icon: Icon(primaryAction.icon),
            ),
    ),
    cupertino: () => cupertino_ui.CupertinoPageScaffold(
      key: key,
      navigationBar: cupertino_ui.CupertinoNavigationBar(
        leading: backAction == null
            ? null
            : adaptiveNavigationBarButton(
                onPressed: backAction.onPressed,
                label: backAction.title,
                icon: backAction.icon,
                child: backAction.child,
              ),
        middle: title,
        trailing: primaryAction == null
            ? null
            : adaptiveNavigationBarButton(
                onPressed: primaryAction.onPressed,
                label: primaryAction.title,
                icon: primaryAction.icon,
                child: primaryAction.child,
              ),
        automaticallyImplyLeading: automaticBackButton,
      ),
      child: body,
    ),
    macos: () => macos_ui.MacosScaffold(
      key: key,
      toolBar: macos_ui.ToolBar(
        leading: backAction == null
            ? null
            : adaptiveNavigationBarButton(
                onPressed: backAction.onPressed,
                label: backAction.title,
                icon: backAction.icon,
                child: backAction.child,
              ),
        actions: [
          if (secondaryActions != null) ...secondaryActions,
          if (primaryAction != null) primaryAction,
        ]
            .map(
              (action) => macos_ui.ToolBarIconButton(
                label: action.title ?? '',
                icon: cupertino_ui.Icon(
                  action.icon,
                  color: macos_ui.MacosColors.textColor,
                ),
                onPressed: action.onPressed,
                showLabel: action.showTitle,
                tooltipMessage: action.tooltip,
              ),
            )
            .toList(),
        title: title,
        automaticallyImplyLeading: automaticBackButton,
      ),
      children: [
        macos_ui.ContentArea(
          builder: (context, controller) => body,
        ),
      ],
    ),
    fluent: () => Column(
      children: [
        if (primaryAction != null || (secondaryActions?.isNotEmpty ?? false))
          fluent_ui.CommandBar(
            primaryItems: [
              if (primaryAction != null)
                fluent_ui.CommandBarButton(
                  onPressed: primaryAction.onPressed,
                  icon: Icon(primaryAction.icon),
                  label: Text(primaryAction.title ?? ''),
                ),
              if (secondaryActions != null)
                ...secondaryActions.map(
                  (action) => fluent_ui.CommandBarButton(
                    onPressed: action.onPressed,
                    icon: Icon(action.icon),
                    label: Text(action.title ?? ''),
                  ),
                ),
            ],
          ),
      ],
    ),
  );
}
