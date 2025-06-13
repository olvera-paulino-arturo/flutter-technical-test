import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/text_styles.dart';
import 'package:flutter/material.dart' show TextTheme;
import 'package:google_fonts/google_fonts.dart';

class MainTextTheme {
  static TextTheme lightTheme = GoogleFonts.openSansTextTheme().copyWith(
    titleMedium: TextStyles.title,
    bodyMedium: TextStyles.text,
    labelMedium: TextStyles.label
  );

  static TextTheme darkTheme = GoogleFonts.openSansTextTheme().copyWith(
    titleMedium: TextStyles.title,
    bodyMedium: TextStyles.text,
    labelMedium: TextStyles.label
  );



}

