import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;

class DarkTheme {
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: color.bleachedCedarColor,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      color: color.bleachedCedarColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: color.seashellColor,
      filled: true,
      hintStyle: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        color: color.ironsideGreyColor,
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
