import 'package:av_root_app/src/component/text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RecentListContainer extends StatelessWidget {
  final imageURl;
  final plantName;

  const RecentListContainer({
    super.key,
    this.imageURl,
    this.plantName,
  });

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Card(
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5),
            borderRadius: BorderRadius.circular(15),
            color:isDark ?  HexColor(RBlackColor): HexColor(RgreenGaryColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:isDark? HexColor(RgreenGaryColor): HexColor(RGreenColor),
                  image: DecorationImage(image: NetworkImage(imageURl),fit: BoxFit.cover)
                ),
                padding: EdgeInsets.all(8),
              height: 130,

            ),
            Text(
              plantName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 1,
      
            ),
          ],
        ),
      ),
    );
  }
}
