import 'package:av_root_app/src/util/widgets/Container/recentlist_container.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../screen/plant Info/details_screen.dart';

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data_plants').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final documents = snapshot.data?.docs;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: documents?.length,
            itemBuilder: (context, index) {
              final name = documents?[index]['plant_name'];
              final imageUrl = documents?[index]['image'];
              final DESC = documents?[index]['plant_desc'];
              final mediPRO = documents?[index]['medicinal_prop'];
              return InkWell(
                onTap: (){
                  print(name);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(plantName: name,plantImage: imageUrl,plantDesc: DESC,plantMedicinalProp: mediPRO, ),));
                },
                child: RecentListContainer(
                  imageURl: imageUrl,
                  plantName: name,
                ),
              );},
          );
        },
      ),
    );
  }
}


