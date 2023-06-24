import 'package:flutter/material.dart';

import 'ResultPage.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*initialRoute: '/0',
      routes: {
        '/0' : (context)=>InputPage(),
        '/1' : (context)=>ResultPage(),
      },*/
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderThemeData(
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayShape: RoundSliderOverlayShape(
            overlayRadius: 30.0,
          ),
          thumbColor: Color(
            0xFF666666,
          ),
          overlayColor: Color(
            0x60666666,
          ),
          activeTrackColor: Color(
            0xFFafa7a5,
          ),
          inactiveTrackColor: Color(
            0xFFcdc5bf,
          ),
        ),
        scaffoldBackgroundColor: Color(0xFF3b0409),
        appBarTheme: AppBarTheme(
          color: Color(0xFF46040c),
          shadowColor: Colors.black,
        ),
      ),
    );
  }
}
