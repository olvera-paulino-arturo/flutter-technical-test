import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String date;
  final String title;
  final Color color;
  const InfoChip({super.key, required this.date, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.bodyMedium,),
        Chip(
          label: Text(date,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white) ),
          backgroundColor: color,
        ),
      ],
    );
  }
}