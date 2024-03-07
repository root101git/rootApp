import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../component/text.dart';

class ContectUsContainerWidgets extends StatelessWidget {
  IconData iconData;
  String nameTitle ;
  String nameSubTitle ;
   ContectUsContainerWidgets({super.key ,
  required this.iconData ,
  required this.nameSubTitle,
  required this.nameTitle
  });

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.grey: Colors.green,
              offset: Offset(
                0.0,
                0.9,
              ),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
            BoxShadow(
              color:isDark? Colors.black12: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Icon(
               iconData,
                size: 35,
              ),
              decoration: BoxDecoration(
                //   color: HexColor(RGaryColor),
                border: Border.symmetric(
                    vertical: BorderSide(
                        color: Colors.greenAccent)),
                //   borderRadius: BorderRadius.circular(5)
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  nameTitle, style: TextStyle(color: isDark? HexColor(RMidnightBlueColor) : Colors.black),
                ),
                Text(
                 nameSubTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: isDark? HexColor(RMidnightBlueColor) : Colors.black,
                     fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
