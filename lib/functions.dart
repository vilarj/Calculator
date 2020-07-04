import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final color; // btn color
  final txtColor; // text color
  final String btnText; // for numbers and operators
  final btnTapped;

  // Constructor
  Btn({this.color, this.txtColor, this.btnText, this.btnTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                btnText,
                style: TextStyle(
                    color: txtColor, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
