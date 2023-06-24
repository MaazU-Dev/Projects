import 'package:flutter/material.dart';
import 'package:untitled1/ReusableCard.dart';

import 'constants.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT', ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 45.0, left: 12.0),
            child: Text(
              'Your Result',
              style: styleText,
            ),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: inactiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Text('avladnv ad', style: styleText,),
                  Text('baf;d', style: styleText,),
                  Text('ckvjba', style: styleText,),
                ],
              ),
            ),
          ),
          BottomBar(
            enterText: 'Oh Yeah Senpai',
          ),
        ],
      ),
    );
  }
}
