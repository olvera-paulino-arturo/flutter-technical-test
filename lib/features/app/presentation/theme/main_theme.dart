import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_colors.dart';
import 'package:contpaqi_technical_test/features/app/presentation/theme/main_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show AppBarTheme, Brightness, ButtonThemeData, ThemeData;

class MainTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    textTheme: MainTextTheme.lightTheme,
    useMaterial3: true,
    primaryColor: AppColors.lightPrimaryColor,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackgroundColor,
      surfaceTintColor: AppColors.lightPrimaryColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.lightPrimaryColor),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.lightPrimaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: MainTextTheme.darkTheme,
    useMaterial3: true,
    primaryColor: AppColors.darkPrimaryColor,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackgroundColor,
      surfaceTintColor: AppColors.darkPrimaryColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.darkPrimaryColor),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.darkPrimaryColor),
  );
}
