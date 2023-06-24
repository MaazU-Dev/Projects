import 'package:flutter/material.dart';

import 'constants.dart';



class genderFiller extends StatelessWidget {
  const genderFiller({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: textColor,
          size: 70,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          style: styleText,
        ),
      ],
    );
  }
}
