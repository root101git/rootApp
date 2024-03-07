import 'package:av_root_app/src/component/text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';

class BookmarkListContainer extends StatelessWidget {
  final imageBMURl ;
  final plantBMName ;


  const BookmarkListContainer({super.key, this.imageBMURl, this.plantBMName ,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
            border: Border.all( width: 1.5),
            borderRadius: BorderRadius.circular(15),
            color: HexColor(RgreenGaryColor)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: HexColor(RGreenColor)),
                padding: EdgeInsets.all(8),
                child: Image(image: AssetImage(imageBMURl),height: 110,)),
            Column(
              children: [
                Text(
                  plantBMName,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ) ,
      ),
    );
  }
}
