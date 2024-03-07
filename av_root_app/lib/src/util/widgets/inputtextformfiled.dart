import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../component/text.dart';



class InputTextFormFiledWidgets extends StatelessWidget {
  final lableName ;
  final controllerName;
  final IconData iconData;
  const InputTextFormFiledWidgets({super.key, this.lableName, this.controllerName,required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
      child: TextFormField(
        controller: controllerName ,
        style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.w600
        ),
        decoration: InputDecoration(
            label: Text(lableName),
            prefixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
            prefixIconColor: HexColor(RGreenColor),
            floatingLabelStyle: TextStyle(),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(width: 2,color: HexColor(RGreenColor))
            )
        ),
      ),
    );
  }
}
