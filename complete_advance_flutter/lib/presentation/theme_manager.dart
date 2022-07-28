import 'package:complete_advance_flutter/presentation/color_manager.dart';
import 'package:complete_advance_flutter/presentation/font_manager.dart';
import 'package:complete_advance_flutter/presentation/style_manager.dart';
import 'package:complete_advance_flutter/presentation/values_manager.dart';
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
      cardTheme: CardTheme(
        color: ColorManager.white,
        elevation: AppSize.s4,
        shadowColor: ColorManager.grey,
      ),
      // ripple
      shadowColor: ColorManager.primaryOpacity70,
      //  button view theme
      buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.primary,
        disabledColor: ColorManager.grey1,
        shape: StadiumBorder(),
        splashColor: ColorManager.primaryOpacity70,
      ),
      //  elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: ColorManager.primary,
            elevation: AppSize.s4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppSize.s12,
              ),
            ),
            textStyle: getRegularTextStyle(
              color: ColorManager.white,
              fontSize: FontSizeManager.s12,
            )),
      ),
      //  app bar view theme
      appBarTheme: AppBarTheme(
        elevation: AppSize.s4,
        color: ColorManager.primary,
        centerTitle: true,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: getRegularTextStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s16,
        ),
      )
      // text theme
      // input decoration( text filed them)
      );
}
