import 'package:av_root_app/src/component/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';


class ListViewBilderW extends StatelessWidget {
  ListViewBilderW({super.key});
  

  static List plantImageURL = [
    plant1,
    plant2,
    plant3,
    plant4,
    plant5,
  ];
  static List plantName = [
    "plant1",
    "plant2",
    "plant3",
    "plant4",
    "plant5",
  ];
  static List plantDescreption = [
    "plant1 Descreption",
    "plant2 Descreption",
    "plant3 Descreption",
    "plant4 Descreption",
    "plant5 Descreption",
  ];


  @override
  Widget build(BuildContext context) {
    final db=  FirebaseFirestore.instance.collection("plant_");
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    
    return Container(
      padding: EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: plantImageURL.length,
        itemExtent: 90,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ListTile(
              // dense: false,
              focusColor: Colors.lightBlue,
              tileColor: isDark ? HexColor(RgreenGaryColor) : HexColor(RGreenColor),
              leading: Container(height:100,child: Image(image: AssetImage(plantImageURL[index]) ,height: 90,)),
              title: Text(plantName[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: isDark ? HexColor(RMidnightBlueColor): Colors.black),),
              subtitle: Text(" plant Discreption",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: isDark ? HexColor(RGaryColor): Colors.black54),),
              trailing: Icon(Iconsax.like_shapes,size: 40, color: isDark ? HexColor(RGaryColor): HexColor(RMidnightBlueColor) ,),
              // title:BookmarkListContainer(
              //   imageBMURl: plantImageURL[index],
              //   plantBMName: plantName[index],
              // ),
              onTap: (){
                print(plantName[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
