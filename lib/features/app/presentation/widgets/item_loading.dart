import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemLoading extends StatelessWidget {
  const ItemLoading({super.key, this.height = 50});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        decoration: AppDecoration.loadingDecoration,
      ),
    );
  }
}