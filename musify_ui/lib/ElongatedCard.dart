import 'package:flutter/material.dart';
class ElongatedCard extends StatelessWidget {
  const ElongatedCard({
    required this.imageLinkText,
    required this.label,
  });

  final imageLinkText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      //Or we can use Expanded() with flex property
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(5),
        ),
        width: 200,
        child: Row(
          children: [
            Image.asset(
              imageLinkText,
              width: 58,
              height: 58,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
