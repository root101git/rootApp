import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class NameTextWidgets extends StatelessWidget {
  final String textName;
  // final TextStyle? textStyle;

  const NameTextWidgets({
    required this.textName,
    // this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Text(
        textName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    ]);
  }
}
