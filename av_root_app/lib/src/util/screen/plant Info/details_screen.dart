import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import '../../../component/text.dart';
import '../../widgets/Text/text_wedgets.dart';

class DetailsScreen extends StatelessWidget {
  final String plantName ;
  final String plantDesc;
  final String plantMedicinalProp;
  final String plantImage;

  DetailsScreen({super.key, required this.plantName, required this.plantDesc, required this.plantMedicinalProp, required this.plantImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${plantName}"),
        actions:[ Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(Iconsax.heart5),
        ),],
        actionsIconTheme: IconThemeData(color: Colors.red,),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: HexColor(RgreenGaryColor), width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(plantImage),
                  padding: EdgeInsets.all(10),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: HexColor(RgreenGaryColor), width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NameTextWidgets(
                            textName: plantName),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          plantDesc,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        NameTextWidgets(
                            textName: "Plant Medicinal Property"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          plantMedicinalProp ,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
