import 'dart:async';
import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/loginscreen.dart';
import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/onbording_screen.dart';
import 'package:av_root_app/src/util/screen/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  void whereToGo() async {
    var sharedPreferene = await SharedPreferences.getInstance();

    var isLoggedIn = sharedPreferene.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationMenu(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => OnBordingScreen(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash Sccreen")),
    );
  }
}
