import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  final String text;

  const SquareBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 30,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFF737A), width:1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}