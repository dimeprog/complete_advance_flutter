import 'package:complete_advance_flutter/presentation/Resources/color_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/font_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/style_manager.dart';
import 'package:complete_advance_flutter/presentation/Resources/values_manager.dart';
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
    ),
    // text theme

    textTheme: TextTheme(
      headline1: getSemiBoldTextStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSizeManager.s16,
      ),
      subtitle1: getMediumTextStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSizeManager.s14,
      ),
      caption: getRegularTextStyle(
        color: ColorManager.grey,
        fontSize: FontSizeManager.s12,
      ),
      bodyText1: getRegularTextStyle(
        color: ColorManager.grey,
        fontSize: FontSizeManager.s12,
      ),
    ),

    // input decoration( text filed them)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularTextStyle(
        color: ColorManager.grey1,
        fontSize: FontSizeManager.s12,
      ),
      labelStyle: getRegularTextStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSizeManager.s12,
      ),
      errorStyle: getRegularTextStyle(
        color: ColorManager.error,
        fontSize: FontSizeManager.s12,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
