import 'package:flutter/material.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/themes/text_theme.dart';

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);

class AppThemes {
  static final appLightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    textTheme: AppTextTheme.textTheme.apply(
      bodyColor: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryColor.withOpacity(0.6),
      unselectedItemColor: AppColors.primaryColor.withOpacity(0.6),
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
  );

  static final appDarkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    // textTheme: AppTextTheme.textTheme.apply(
    //   bodyColor: Colors.white,
    // ),
  );
}
