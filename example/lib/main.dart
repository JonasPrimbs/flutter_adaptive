import 'package:adaptive_flutter/adaptive_flutter.dart';
import 'package:flutter/cupertino.dart' as cupertino_ui;
import 'package:flutter/material.dart' as material_ui;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart' as macos_ui;
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;

void main() async {
  await initializeAdaptive(
    macosMakeTitleBarTransparent: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return adaptiveApp(
      title: 'Demo',
      home: adaptiveWindow(
        sidebar: AdaptiveSidebar(
          titleBar: Text('Sidebar Titlebar'),
          footer: Text('Sidebar Footer'),
          builder: (context, scrollController) => Center(
            child: Text('Sidebar Body'),
          ),
        ),
        body: adaptivePageScaffold(
          title: Text('Sample App'),
          primaryAction: AdaptiveAction(
            title: 'Add',
            onPressed: () => print('works'),
            icon: adaptive(
              material: () => material_ui.Icons.add,
              cupertino: () => cupertino_ui.CupertinoIcons.add,
              fluent: () => fluent_ui.FluentIcons.add,
            ),
            tooltip: 'Adds something',
            showTitle: true,
          ),
          body: Center(
            child: Text('Sample App'),
          ),
        ),
      ),
    );
  }
}
