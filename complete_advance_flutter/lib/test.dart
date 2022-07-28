import 'package:complete_advance_flutter/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);
  void updataState() {
    MyApp.instance.appState = 10;
  }

  void printState() {
    print(MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
