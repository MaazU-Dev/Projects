import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ResultPage.dart';
import 'ReusableCard.dart';
import 'constants.dart';
import 'iconContent.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int height = 180;
  int weight = 60;
  int age=21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        foregroundColor: textColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? cardColor
                          : inactiveCardColor,
                      childCard: genderFiller(
                        icon: FontAwesomeIcons.mars,
                        text: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(
                          () {
                            selectedGender = Gender.female;
                          },
                        );
                      },
                      colour: selectedGender == Gender.female
                          ? cardColor
                          : inactiveCardColor,
                      childCard: genderFiller(
                        icon: FontAwesomeIcons.venus,
                        text: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: inactiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: styleText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text('cm', style: styleText),
                      ],
                    ),
                    /* SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0,),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0,),
                        thumbColor: Color(0xFF666666,),
                        overlayColor: Color(0x60666666,),
                        activeTrackColor: Color(0xFFafa7a5,),
                        inactiveTrackColor: Color(0xFFcdc5bf,),

                      ),
                      child: */
                    Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
/*
                    ),
*/
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: inactiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: styleText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: numberTextStyle,
                              ),
                              Text(
                                'KG',
                                style: styleText,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                updateVal: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 20.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.add,
                                updateVal: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(colour: inactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age', style: styleText,),
                        Text(age.toString(), style: numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, updateVal: (){
                              setState(() {
                                age--;
                              });
                            },),
                            SizedBox(width: 20.0,),
                            RoundIconButton(icon: FontAwesomeIcons.add, updateVal: (){
                              setState(() {
                                age++;
                              });
                            },)
                          ],
                        )
                      ],
                    ),),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(),),);
              },
              child: BottomBar(enterText: 'CALCULATE SENPAI',),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({

    required this.enterText,
  });

  final String enterText;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(enterText, style: bottomBarTextStyle,)),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        color: bottomBarColor,
      ),
      width: double.infinity,
      height: 80.0,
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, this.icon, this.updateVal})
      : super(key: key);

  final IconData? icon;
  final VoidCallback? updateVal;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: updateVal,
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      fillColor: Color(0x7046040c),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
