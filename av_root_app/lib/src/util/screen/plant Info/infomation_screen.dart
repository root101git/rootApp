import 'package:av_root_app/src/component/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'details_screen.dart';

class IinformationScreen extends StatefulWidget {
   IinformationScreen({super.key});

  @override
  State<IinformationScreen> createState() => _IinformationScreenState();
}

class _IinformationScreenState extends State<IinformationScreen> {
  late String imageURL ;
  final storage = FirebaseStorage.instance;

  CollectionReference reference = FirebaseFirestore.instance.collection("data_plants");
  late Stream<QuerySnapshot> _plantItems ;




  @override
  void initState() {
    super.initState();

    imageURL = "";
    getImageURL();
     _plantItems=  reference.snapshots();
  }
  Future<void> getImageURL() async{
    final ref = storage.ref().child('/plant_images/neem.png');
    final url = await ref.getDownloadURL();
    setState(() {
      imageURL = url ;
    });
  }

  @override
    Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Medicinal plants'),
        ),
        body: StreamBuilder(
          stream: _plantItems,
          builder: (BuildContext context,
            AsyncSnapshot  snapshot) {
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.connectionState == ConnectionState.active){
              QuerySnapshot querySnapshot = snapshot.data;
            }
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = snapshot.data.docs[index];
                return Card(
                  color: isDark? HexColor(RgreenGaryColor): HexColor(RGreenColor),
                  shadowColor: HexColor(RGreenColor),
                  child: ListTile(
                    leading: CircleAvatar(child: Image(image: NetworkImage(document['image']),)),
                    title: Text(document['plant_name'],maxLines: 1,),
                    subtitle: Text(document['medicinal_prop'],maxLines: 1,),
                    titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: isDark? HexColor(RBlackColor):HexColor(RMidnightBlueColor)),
                    subtitleTextStyle: TextStyle(color: Colors.black),
                    trailing: Icon(FontAwesomeIcons.heart),
                    minVerticalPadding: 10,
                    onTap: (){
                      print(document['plant_name']);
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          DetailsScreen(
                              plantName: document['plant_name'],
                              plantDesc: document['plant_desc'],
                              plantImage: document['image'],
                              plantMedicinalProp: document['medicinal_prop']
                          ,),
                      ));
                    },
                  ),
                );
              },
            );
          },
        ),
      );
    }
  }