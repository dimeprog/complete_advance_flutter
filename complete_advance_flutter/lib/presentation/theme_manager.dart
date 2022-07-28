import 'package:complete_advance_flutter/presentation/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main color of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.darkGrey,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    accentColor: ColorManager.grey,
    // card view  theme
    //  app bar view theme
    // text theme
    // input decoration( text filed them)
  );
}
