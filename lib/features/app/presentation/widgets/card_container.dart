import 'package:contpaqi_technical_test/core/types/action_types.dart';
import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_decorations.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final OnVoidAction? onAction;

  const CardContainer({super.key, required this.child, required this.onAction});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.cardDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onAction,
        child: child,
      ),
    );
  }
}