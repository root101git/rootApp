import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            "OnBording Sccreen"
        ),
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      },
      child: Icon(FontAwesomeIcons.arrowRight ,color: Colors.black,),),
    );
  }
}
