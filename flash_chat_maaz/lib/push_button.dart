import 'package:flutter/material.dart';

class PushButton extends StatelessWidget {
  const PushButton({
    super.key,
    this.textString,
    required this.onPressedFunc,
    required this.colorButton
  });

  final String? textString;
  final Function onPressedFunc;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colorButton,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Go to login screen.
            /*Navigator.pushNamed(context, LoginScreen.id);*/
            onPressedFunc();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            textString!,
          ),
        ),
      ),
    );
  }
}
