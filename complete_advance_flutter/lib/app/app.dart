import 'package:flutter/cupertino.dart';
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
    return Container();
  }
}
