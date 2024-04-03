

import 'package:av_root_app/src/component/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

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

  static RoundButton(String title, VoidCallback onTap ,){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: HexColor(RgreenGaryColor),
          borderRadius: BorderRadius.circular(20)

        ),
        child: Text(title,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
      ),
    );
  }



}