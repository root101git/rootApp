import 'package:av_root_app/src/component/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../plant Info/details_screen.dart';


class BookmarkScreen extends StatefulWidget {
  BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  late String imageURL ;


  CollectionReference reference = FirebaseFirestore.instance.collection("add_favourite");
  late Stream<QuerySnapshot> _plantItems ;




  @override
  void initState() {
    super.initState();
    _plantItems=  reference.snapshots();
  }


  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BookMark'),
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
                  leading: ClipRRect(borderRadius: BorderRadius.circular(20) , child: Image( height:60 ,width:70 ,fit: BoxFit.cover ,image: NetworkImage(document['plant_image']),)),
                  title: Text(document['plant_name'],maxLines: 1,),
                  subtitle: Text(document['plant_medicanalProp'],maxLines: 1,),
                  titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: isDark? HexColor(RBlackColor):HexColor(RMidnightBlueColor)),
                  subtitleTextStyle: TextStyle(color: Colors.black),
                  minVerticalPadding: 10,
                  onTap: (){
                    print(document['plant_name']);
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        DetailsScreen(
                          plantName: document['plant_name'],
                          plantDesc: document['plant_desc'],
                          plantImage: document['plant_image'],
                          plantMedicinalProp: document['plant_medicanalProp']
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