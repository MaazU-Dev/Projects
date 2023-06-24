import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    required this.imageLinkText,
    required this.label,
  });

  final String imageLinkText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      child: Column(
        children: [
          Image.asset(
            imageLinkText,

            height: 160,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}