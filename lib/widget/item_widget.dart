import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;

  const ItemWidget({Key? key, required this.imagePath, required this.text1, required this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 10.0),
        Text(text1),
        Text(text2),
      ],
    );
  }
}


