import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isWrapped;

  const MovieItem({
    super.key,
    required this.title,
    required this.description,
    required this.isWrapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 6, top: 12),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: isWrapped ? 2 : null,
            overflow: isWrapped ? TextOverflow.ellipsis : null,
          ),
        ),
      ],
    );
  }
}
