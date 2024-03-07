import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHlper {


  static costomeTextFilde(TextEditingController controller,String text ,IconData iconData , bool toHode){
    return TextField(
      controller: controller,
      obscureText: toHode,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: Icon(iconData),
      ),
    );
  }


  static CoustomAlertBox (BuildContext context , String text){
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title:Text(text) ,
      );
    },);
  }
}