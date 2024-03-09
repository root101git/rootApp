import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import '../../../component/text.dart';
import '../../widgets/Text/text_wedgets.dart';

class DetailsScreen extends StatefulWidget {
  final String plantName;
  final String plantDesc;
  final String plantMedicinalProp;
  final String plantImage;

  DetailsScreen(
      {super.key,
      required this.plantName,
      required this.plantDesc,
      required this.plantMedicinalProp,
      required this.plantImage});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final firestore = FirebaseFirestore.instance.collection("add_favourite");

  void favouritePlant(String namePlant, String descPlant, String medicinalproPlant,
      String imagePlant) {
    firestore.doc(namePlant.toString()).set({
      'plant_name': namePlant.toString(),
      'plant_desc': descPlant.toString(),
      'plant_medicanalProp': medicinalproPlant.toString(),
      'plant_image': imagePlant.toString()
    }).then((value) {
      print("data addd sucseefully ");

    }).onError((error, stackTrace) {
      print("error aa gyi bhai ");
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.plantName}"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: (){
                setState(() {
                  favouritePlant(widget.plantName, widget.plantDesc, widget.plantMedicinalProp, widget.plantImage);
                });

              },
                child: Icon(Iconsax.heart5)),
          ),
        ],
        actionsIconTheme: IconThemeData(
          color: Colors.red,
        ),
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
                  child: Image.network(widget.plantImage),
                  padding: EdgeInsets.all(10),
                ),
                SizedBox(
                  height: 10,
                ),
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
                        NameTextWidgets(textName: widget.plantName),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.plantDesc,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        NameTextWidgets(textName: "Plant Medicinal Property"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.plantMedicinalProp,
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
