import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors_const.dart' as color;
import '../enums/themes_enum.dart';

class ThemesApp {
  static final themes = {
    Themes.lightTheme: ThemeData(
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
    )

    // Themes.darkTheme: ThemeData()
  };
}
