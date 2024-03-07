import 'package:av_root_app/src/component/text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class NetwoekController extends GetxController{
  
  final Connectivity connectivity =Connectivity();
  @override
  void onInit() {
    // TODO: implement onInit
      super.onInit();
      connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
      
  }
  
  void _updateConnectionStatus (ConnectivityResult connectivityResult){
    if(connectivityResult == ConnectivityResult.none){
      Get.rawSnackbar(
          messageText: Text("Please connect to the internate",style: TextStyle(fontSize: 20),),
          isDismissible: false,
        duration: Duration(milliseconds: 200),
        backgroundColor: HexColor(RgreenGaryColor),
        icon:Icon(FontAwesomeIcons.wifi),
        snackStyle: SnackStyle.FLOATING
      );
    }else{
      if(Get.isSnackbarOpen){
        Get.closeCurrentSnackbar();
      }
    }
  }
  
}