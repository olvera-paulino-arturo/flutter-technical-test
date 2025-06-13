
import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_colors.dart';
import 'package:flutter/material.dart' show TextStyle;
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle title = GoogleFonts.openSans().copyWith(
    color: AppColors.lightTextColor,
    fontSize: 18,
  );

  static TextStyle text = GoogleFonts.openSans().copyWith(
    color: AppColors.lightTextColor,
    fontSize: 14,
  );
}