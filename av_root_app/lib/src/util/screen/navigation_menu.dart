import 'package:av_root_app/src/component/text.dart';
import 'package:av_root_app/src/util/screen/Bookmark/bookmark_screen.dart';
import 'package:av_root_app/src/util/screen/Home/home_screen.dart';
import 'package:av_root_app/src/util/screen/Profile/profile_screen.dart';
import 'package:av_root_app/src/util/screen/Store/store_screen.dart';
import 'package:av_root_app/src/util/screen/plant%20Info/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import '../../authentication/login_signup/loginscreen.dart';
import 'Scan/scanscreen.dart';

class NavigationMenu extends StatelessWidget {
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar: Obx(() => NavigationBar(
            height: 70,
            elevation: 0,
            indicatorColor: HexColor(RgreenGaryColor),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>controller.selectedIndex.value = index,
            destinations: [
              NavigationDestination(icon: Icon( Iconsax.home),label: "Home",selectedIcon: Icon(Iconsax.home,),),
              NavigationDestination(icon: Icon( Iconsax.shop), label: "Store"),
              NavigationDestination(icon: Icon( Iconsax.scan, ),label: "Scan"),
              NavigationDestination(icon: Icon(Iconsax.save_2 ,), label: "bookmark"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ],
          )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    StoreScreen(),
    ScannerScreen(),
    BookMarkScreen(),
    SettingScreen()
  ];
}
