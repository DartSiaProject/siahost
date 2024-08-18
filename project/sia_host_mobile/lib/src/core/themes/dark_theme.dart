import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/constants/colors_const.dart';

class DarkTheme {
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsApp.bleachedCedarColor,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      color: ColorsApp.transparentColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorsApp.seashellColor,
      filled: true,
      hintStyle: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        color: ColorsApp.ironsideGreyColor,
        fontSize: 16.0.sp,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
      ),
    ),
  );
}
