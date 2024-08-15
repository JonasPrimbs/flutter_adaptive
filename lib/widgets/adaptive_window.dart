import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart' as macos_ui;

import '../adaptive.dart';
import '../data/data.dart';

Widget adaptiveWindow({
  Key? key,
  required Widget body,
  AdaptiveSidebar? sidebar,
}) {
  return adaptive(
    material: () => body,
    cupertino: () => body,
    macos: () => macos_ui.MacosWindow(
      sidebar: sidebar == null
          ? null
          : macos_ui.Sidebar(
              minWidth: sidebar.minWidth,
              startWidth: sidebar.initialWidth,
              maxWidth: sidebar.maxWidth,
              isResizable: sidebar.isResizable,
              top: sidebar.titleBar == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 80.0,
                        bottom: 10.0,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(
                          height: 30.0,
                        ),
                        child: Center(
                          child: sidebar.titleBar,
                        ),
                      ),
                    ),
              bottom: sidebar.footer,
              builder: sidebar.builder,
              topOffset: sidebar.titleBar == null ? 52.0 : 0.0,
            ),
      child: body,
    ),
  );
}
