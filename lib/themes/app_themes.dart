import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/themes/text_theme.dart';

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);

class AppThemes {
  static final appLightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    textTheme: AppTextTheme.textTheme.apply(
      displayColor: AppColors.primaryColor,
      bodyColor: AppColors.primaryColor,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(vertical: Dimens.gap_dp16),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primaryColor),
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.white.withOpacity(0.2),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          AppTextTheme.textTheme.headline2!.copyWith(fontSize: 13),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.gap_dp24),
          ),
        ),
      ),
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
}
