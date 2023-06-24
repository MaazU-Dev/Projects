import 'package:flutter/material.dart';
import 'package:musify_ui/AlbumView.dart';

class AlbumCard extends StatelessWidget {
  final imageLinkText;
  final label;
  final VoidCallback onPress;
  const AlbumCard({
    required this.imageLinkText,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageLinkText,
            width: 120,
            height: 120,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(label),
        ],
      ),
    );
  }
}
