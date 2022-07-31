import 'dart:async';

import 'package:complete_advance_flutter/presentation/Resources/assets_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _onStart() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardRoute);
  }

  @override
  void initState() {
    super.initState();
    _onStart();
  }

  @override
  void dispose() {
    super.dispose();

    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(AssetManager.splashLogo),
      ),
    );
  }
}
