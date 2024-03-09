
import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/onbording_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../util/screen/Splash onBording Login/loginscreen.dart';

class AuthenticatorRepository extends GetxController{
  static AuthenticatorRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }

   screenRedirect() async {
     deviceStorage.writeIfNull('isFirstTime', true);
     deviceStorage.read('isFirstTime') != true ? Get.offAll(()=> LoginScreen()) : Get.offAll(()=> OnBordingScreen());
   }



}