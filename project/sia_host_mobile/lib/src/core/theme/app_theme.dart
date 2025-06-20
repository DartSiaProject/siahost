import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The [AppTheme] defines theme for the app.
///
abstract final class AppTheme {
  static const primaryColor = Color(0xFF20EE82);
  static const backgoundColor = Color(0xFF242132);
  static const boxBgColor = Color(0xFF39314b);
  static const bodyTextColor = Color(0xFFBDBDBD);
  static const inactiveNavIconColor = Color(0xFF676D75);
  static const inputColor = Color(0xFF666666);

  // The FlexColorScheme defined dark mode ThemeData.
  static final ThemeData _theme = FlexThemeData.dark(
    fontFamily: 'Manrope',
    scheme: FlexScheme.custom,
    scaffoldBackground: backgoundColor,
    surface: boxBgColor,
    dialogBackground: boxBgColor,

    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: Color(0xFF20EE82),
      secondary: Color(0xFF37364B),
    ),
    usedColors: 1,
    useMaterial3ErrorColors: true,

    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 12,
      textButtonRadius: 12,
      filledButtonRadius: 12,
      elevatedButtonRadius: 12,
      outlinedButtonRadius: 12,
      segmentedButtonRadius: 12,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      fabUseShape: true,
      fabAlwaysCircular: true,
      alignedDropdown: true,
      snackBarRadius: 12,
      bottomSheetElevation: 5,
      navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      navigationBarUnselectedLabelSchemeColor: SchemeColor.onSecondary,
      navigationBarSelectedIconSchemeColor: SchemeColor.primary,
      navigationBarUnselectedIconSchemeColor: SchemeColor.onSecondary,
      navigationRailUseIndicator: true,
      inputDecoratorFillColor: Color(0xFFF1F1F1),
    ),

    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontWeight: FontWeight.w800),
      displaySmall: TextStyle(fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontWeight: FontWeight.w300),
      bodySmall: TextStyle(fontWeight: FontWeight.w200),
      labelLarge: TextStyle(fontWeight: FontWeight.w600),
      labelMedium: TextStyle(fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontWeight: FontWeight.w400),
    ).apply(
      displayColor: Colors.white,
      bodyColor: bodyTextColor,
    ),
  );

  static ThemeData theme = _theme.copyWith(
    cardTheme: _theme.cardTheme.copyWith(
      color: boxBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.zero,
    ),
    appBarTheme: _theme.appBarTheme.copyWith(
      backgroundColor: backgoundColor,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
    ),
    popupMenuTheme: _theme.popupMenuTheme.copyWith(
      surfaceTintColor: boxBgColor,
    ),
    bottomSheetTheme: _theme.bottomSheetTheme.copyWith(
      backgroundColor: boxBgColor,
    ),
    inputDecorationTheme: _theme.inputDecorationTheme.copyWith(
      hintStyle: const TextStyle(color: inputColor),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
  );
}
