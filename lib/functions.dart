import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final color; // btn color
  final txtColor; // text color
  final String btnText; // for numbers and operators

  // Constructor
  Btn({this.color, this.txtColor, this.btnText});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: color,
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(color: txtColor),
          ),
        ),
      ),
    );
  }
}
