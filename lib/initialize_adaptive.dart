import 'package:adaptive_flutter/adaptive_flutter.dart';
import 'package:macos_ui/macos_ui.dart' as macos_ui;

Future<void> initializeAdaptive({
  macos_ui.NSWindowToolbarStyle macosToolbarStyle =
      macos_ui.NSWindowToolbarStyle.unified,
  bool macosEnableFullSizeContentView = true,
  bool macosMakeTitleBarTransparent = true,
  bool macosHideTitle = true,
  bool macosRemoveMenubarInFullScreenMode = true,
  bool macosAutoHideToolbarAndMenuBarInFullScreenMode = true,
}) async {
  await adaptive<Future<void>>(
    material: () async {},
    macos: () async {
      await macos_ui.MacosWindowUtilsConfig(
        toolbarStyle: macosToolbarStyle,
        enableFullSizeContentView: macosEnableFullSizeContentView,
        makeTitlebarTransparent: macosMakeTitleBarTransparent,
        hideTitle: macosHideTitle,
        removeMenubarInFullScreenMode: macosRemoveMenubarInFullScreenMode,
        autoHideToolbarAndMenuBarInFullScreenMode:
            macosAutoHideToolbarAndMenuBarInFullScreenMode,
      ).apply();
    },
  );
}
