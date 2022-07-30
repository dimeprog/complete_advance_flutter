import 'package:complete_advance_flutter/presentation/Resources/assets_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

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
