import 'package:av_root_app/src/component/text.dart';
import 'package:av_root_app/src/util/widgets/Text/text_wedgets.dart';
import 'package:av_root_app/src/util/widgets/search_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import '../../widgets/Container/Slider.dart';
import '../../widgets/Container/listview.dart';
import '../plant Info/infomation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchcCntroller = TextEditingController();
  CollectionReference reference =
      FirebaseFirestore.instance.collection("data_plants");
  late Stream<QuerySnapshot> _plantItems;

  @override
  void initState() {
    super.initState();

    _plantItems = reference.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AV_AppName,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Iconsax.setting_45,
                        color: HexColor(RGreenColor),
                        size: 35,
                      ))),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBoxWidgets(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NameTextWidgets(textName: "recomended"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IinformationScreen(),
                              ));
                        },
                        child: Text("see all"),
                      )
                    ],
                  ),
                  Container(
                    height: 220,
                    color: Colors.blue,
                    child: HorizontalListView(),
                  ),
                  Divider(),
                  Container(height: 180, child: CarouselSliderFromFirestore()),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NameTextWidgets(textName: "recomended"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IinformationScreen(),
                              ));
                        },
                        child: Text("see all"),
                      )
                    ],
                  ),
                  Container(
                    height: 240,
                    color: Colors.blue,
                    child: HorizontalListView(),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
