import 'package:complete_advance_flutter/presentation/Resources/routes_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/theme_manager.dart';
import 'package:complete_advance_flutter/presentation/views/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private internal class

  int appState = 0;
  static final instance = MyApp._internal();

  factory MyApp() => instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
