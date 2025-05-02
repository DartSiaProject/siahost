import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The [AppTheme] defines theme for the app.
///
abstract final class AppTheme {
  static const primaryColor = Color(0xFF20EE82);
  static const backgoundColor = Color(0xFF242132);
  static const boxBgColor = Color(0xFF37364B);
  static const bodyTextColor = Color(0xFFBDBDBD);

  // The FlexColorScheme defined dark mode ThemeData.
  static final ThemeData _theme = FlexThemeData.dark(
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
    textTheme: GoogleFonts.manropeTextTheme().apply(
      displayColor: Colors.white,
      bodyColor: bodyTextColor,
    ),
  );

  static ThemeData theme = _theme.copyWith(
    cardColor: const Color(0xFF37364B),
    bottomSheetTheme: _theme.bottomSheetTheme.copyWith(
      backgroundColor: boxBgColor,
    ),
    inputDecorationTheme: _theme.inputDecorationTheme.copyWith(
      hintStyle: const TextStyle(color: Color(0xFF666666)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
    textTheme: GoogleFonts.manropeTextTheme().copyWith(
      displayLarge: GoogleFonts.manrope(color: Colors.white),
      displayMedium: GoogleFonts.manrope(color: Colors.white),
      displaySmall: GoogleFonts.manrope(color: Colors.white),
      headlineLarge: GoogleFonts.manrope(color: Colors.white),
      headlineMedium: GoogleFonts.manrope(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: GoogleFonts.manrope(color: Colors.white),
      titleLarge: GoogleFonts.manrope(color: const Color(0xFFBDBDBD)),
      titleMedium: GoogleFonts.manrope(color: const Color(0xFFBDBDBD)),
      titleSmall: GoogleFonts.manrope(color: const Color(0xFFBDBDBD)),
      // bodyLarge: GoogleFonts.manrope(color: Color(0xFFBDBDBD)),
      // bodyMedium: GoogleFonts.manrope(color: Color(0xFFBDBDBD)),
      bodySmall: GoogleFonts.manrope(color: const Color(0xFFBDBDBD)),
      labelLarge: GoogleFonts.manrope(color: const Color(0xFFBDBDBD)),
      labelMedium: GoogleFonts.manrope(color: const Color(0xFFBDBDBD)),
      labelSmall: GoogleFonts.manrope(color: const Color(0xFFBDBDBD)),
      bodyLarge: GoogleFonts.manrope(color: const Color(0xFF666666)),
      bodyMedium: GoogleFonts.manrope(color: const Color(0xFF666666)),
    ),
  );
}
