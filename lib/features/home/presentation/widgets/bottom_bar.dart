import 'package:contpaqi_technical_test/core/types/action_types.dart';
import 'package:contpaqi_technical_test/features/home/presentation/helpers/tab_generator.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final OnAction<int> onSelect;
  const BottomBar({super.key, required this.currentIndex, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: TabGenerator.generate(context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      currentIndex: currentIndex,
      onTap: onSelect,
    );
  }
}
