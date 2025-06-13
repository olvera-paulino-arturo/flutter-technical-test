import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_colors.dart';
import 'package:flutter/material.dart' show BoxShadow, Offset;

class AppShadows {
  static BoxShadow appShadow = const BoxShadow(
    color: AppColors.mainShadow,
    blurRadius: 2,
    offset: Offset(0, 2),
  );
}