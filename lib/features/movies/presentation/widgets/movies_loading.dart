import 'package:contpaqi_technical_test/features/app/presentation/widgets/item_loading.dart';
import 'package:flutter/material.dart';

class MoviesLoading extends StatelessWidget {
  const MoviesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: const ItemLoading(),
        );
      },
    );
  }
}




