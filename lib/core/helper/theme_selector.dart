import 'package:contpaqi_technical_test/features/app/presentation/theme/main_theme.dart';
import 'package:flutter/material.dart';

class ThemeSelector {
  static ThemeData getTheme(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode ? MainTheme.darkTheme : MainTheme.theme;
  }
}