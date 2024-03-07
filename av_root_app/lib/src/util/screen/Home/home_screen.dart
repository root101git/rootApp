import 'package:av_root_app/src/component/text.dart';
import 'package:av_root_app/src/util/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import '../../widgets/Container/recentlist_container.dart';
import '../plant Info/infomation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AV_AppName,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
                decoration: BoxDecoration(
                    color: HexColor(RGreenColor),
                    borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.setting_45,
                      color: Colors.black,
                      size: 35,
                    ))),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBoxWidgets(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AV_Recommended,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IinformationScreen(),
                              ));

                          print("See all button ");
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(color: HexColor(RgreenGaryColor)),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                      height: 180,
                      alignment: Alignment.center,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          RecentListContainer(
                            plantName: "plant name",
                            imageURl: plant1,
                          ),
                          RecentListContainer(
                            plantName: "alovera",
                            imageURl: plant5,
                          ),
                          RecentListContainer(
                            plantName: "plant 1",
                            imageURl: plant2,
                          ),
                          RecentListContainer(
                            plantName: "plant",
                            imageURl: plant4,
                          ),
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AV_Populear,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    InkWell(
                        onTap: () {
                          print("See all button ");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IinformationScreen(),
                              ));
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(color: HexColor(RgreenGaryColor)),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                      height: 180,
                      alignment: Alignment.center,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          RecentListContainer(
                            plantName: "plant name",
                            imageURl: plant1,
                          ),
                          RecentListContainer(
                            plantName: "alovera",
                            imageURl: plant5,
                          ),
                          RecentListContainer(
                            plantName: "plant 1",
                            imageURl: plant2,
                          ),
                          RecentListContainer(
                            plantName: "plant",
                            imageURl: plant4,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
