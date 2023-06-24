import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({super.key, required this.colour, this.childCard, this.onPress});

  final Color colour;
  final Widget? childCard;
 /* final Function onPress;*/
/*  The argument type 'Function' can't be assigned to the parameter type 'void Function()?
  it is showing this error with the statement
  onTap: onPress,

  The error message you're seeing suggests that the type of the onPress function is not compatible with the expected type of the onTap callback.

  onTap is expecting a function with no arguments and no return value, i.e., a void Function(). However, the onPress function that you're passing in has an unspecified function signature, i.e., it could be any function that takes any number of arguments and returns any type of value.

  To fix this error, you need to ensure that the onPress function has the correct signature of void Function(). You can do this by updating the Function type to VoidCallback in the class definition, which is a shorthand for void Function().*/

  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}