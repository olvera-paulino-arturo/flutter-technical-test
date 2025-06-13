import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_colors.dart';
import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_shadows.dart';
import 'package:flutter/material.dart' show Border, BorderRadius, BoxDecoration, BoxShadow, Colors, Radius;

class AppDecoration {
  static BoxDecoration cardDecoration = BoxDecoration(
      color: Colors.white,
      border: Border.all(color: AppColors.card),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      boxShadow: <BoxShadow>[AppShadows.appShadow]);


  static BoxDecoration loadingDecoration = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(8)),
  );
}