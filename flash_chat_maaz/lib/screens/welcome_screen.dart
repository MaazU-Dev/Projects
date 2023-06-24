import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_maaz/screens/login_screen.dart';
import 'package:flash_chat_maaz/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../push_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/0';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController? controller1;
  AnimationController? controller2;
  Animation? animation1;
  Animation? animation2;
  Animation? animation3;
  bool colorCheck = true;
  bool? check2 = true;

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller= AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      */ /*upperBound: 100.0 // UpperBound for curves should not be greater than 1*/ /*
    );

    animation= CurvedAnimation(parent: controller!, curve: Curves.easeOutCubic);

    controller?.forward();

    controller?.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        controller?.reverse(from: 1.0);
      }else if(status==AnimationStatus.dismissed){
        controller?.forward();
      }
    });

    controller?.addListener(() {
      setState(() {

      });
      print(animation?.value);
    });
  }

*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller2 = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation3 =
        CurvedAnimation(parent: controller2!, curve: Curves.easeOutCubic);

    controller2?.forward();

    controller2?.addListener(() {
      setState(() {});
      print(animation3?.value);
    });
  }

  void ColorAnimations() {
    colorCheck = false;

    controller1 = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      /*upperBound: 100.0 // UpperBound for curves should not be greater than 1*/
    );

    animation1 = ColorTween(begin: Colors.white, end: Colors.blueGrey)
        .animate(controller1!);
    animation2 = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller1!);

   /* if (check2!) {
      controller1?.forward();
      controller2?.forward(); // add this line to start the animation of animation2
      check2 = false;
    } else {
      setState(() {
        colorCheck = true;
      });
      check2 = true;
      controller2?.reverse(); // add this line to reverse the animation of animation2
    }*/


    if (check2!) {
      controller1?.forward();
      check2 = false;
    } else {
      colorCheck = true;
      setState(() {

      });
      check2 = true;
    }

    controller1?.addListener(() {
      setState(() {});
      print(animation2?.value);
    });

  }

  @override
  void dispose() {
    controller1?.dispose();
    // Extra resources utilized!!!
    controller2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*
      backgroundColor: Colors.blueGrey.withOpacity(controller?.value as double),
*/
      backgroundColor: colorCheck ? Colors.white : animation1?.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: GestureDetector(
                      onTap: ColorAnimations,
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: animation3?.value * 70,
                      ),
                    ),
                  ),
                ),
                AnimatedTextKit(
                  totalRepeatCount: 5,
                  pause: Duration(milliseconds: 3000),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        color: colorCheck ? Colors.blueGrey : Colors.white,
/*
                        color: colorCheck ? Colors.blueGrey : animation2?.value,
*/
/*
                        color: Colors.black,
*/
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
               /* AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        color: colorCheck ? Colors.blueGrey : animation2?.value,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            PushButton(
              textString: 'Log In',
              colorButton: Colors.lightBlueAccent,
              onPressedFunc: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            PushButton(
              textString: 'Register',
              colorButton: Colors.blueAccent,
              onPressedFunc: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
