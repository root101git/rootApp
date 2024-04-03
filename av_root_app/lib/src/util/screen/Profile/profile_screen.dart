
import 'dart:io';
import 'package:av_root_app/src/component/text.dart';
import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../page/contect_us_page.dart';
import '../../page/edit_profile_page.dart';
import '../../widgets/Text/text_wedgets.dart';
import '../Splash onBording Login/splash_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _switchModeValue = false;
  bool _switchNotificationValue = false;

   File? _image;
  final picker = ImagePicker();

  // Initial switch value
  String messMode = "Mode Off";
  String messNotiFy = "notification Off";

  // Initial message
  void changeMode() {
    setState(() {
      if (_switchModeValue) {
        messMode = "mode On";
        print(messMode);
      } else {
        messMode = "mode Off";
        print(messMode);
      }
    });
  }

  void notificationmode() {
    setState(() {
      if (_switchNotificationValue) {
        messNotiFy = "notification On";
        print(messNotiFy);
      } else {
        messNotiFy = "notification Off";
        print(messNotiFy);
      }
    });
  }
  Future getImagegallery() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    setState(() {
      if (pickedFile != null) {
       _image = File(pickedFile.path);
      } else {
        print('image not selected ');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title:  Text(
          "Profile",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // profile Container    😊😊😊😊😊
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect (
                        borderRadius: BorderRadius.circular(100),
                        child: Container(color: HexColor(RGreenColor),
                          child: _image != null
                              ? Image.file(_image!.absolute,fit: BoxFit.cover,): Image(
                            image: AssetImage("assets/user.png"),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: (){
                           getImagegallery();
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: HexColor(ROrangeGaryColor),
                                border: Border.all(color: HexColor(ROrangeColor))),
                            child: Icon(Iconsax.camera),
                          ),
                        ))
                  ]),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      NameTextWidgets(textName: " ./User Name."),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(),));
                      },style: ButtonStyle(shape: null), child: Text("edit profile"))
                    ],
                  ),

                ],
              ),
              SizedBox(height: 15,),
              Divider( thickness: 0.5),
              Text(
                "    Theme",
                style: TextStyle(fontSize: 20, ),
              ),
              SwitchListTile(
                title: Text(
                  ' Dark Mode',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                secondary: CircleAvatar(backgroundColor: HexColor(RBlueColor),
                    child: Icon(
                      isDark? Iconsax.sun_fog5 : Iconsax.moon,
                      size: 30,
                    )),
                value: _switchModeValue,
                onChanged: (newValue) {
                  setState(() {
                    _switchModeValue = newValue;
                    changeMode();
                  });
                },
              ),
              SizedBox(height: 10,),
              Text(
                "    Notification",
                style: TextStyle(fontSize: 20,),
              ),
              SwitchListTile(
                title: Text(
                  'Notifications',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                secondary: CircleAvatar(
                    child: Icon(
                      Iconsax.notification,
                      size: 30,
                    )),
                value: _switchNotificationValue,
                onChanged: (n) {
                  setState(() {
                    _switchNotificationValue = n;
                    notificationmode(); // Call the function to update the message
                  });
                },
              ),
              SizedBox(height: 10,),
              Text(
                "    Regional",
                style: TextStyle(fontSize: 20, ),
              ),
              ListTile(
                title: Text(
                  'Language',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(child: Icon(Iconsax.language_square,size: 27,)),
                trailing: Icon(Iconsax.arrow_circle_right,size: 28,),
              ),
              Divider(thickness: 0.5),
              ListTile(
                title: Text(
                  'Feedback',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,color: isDark?Colors.white60: HexColor(RMidnightBlueColor)),
                ),
                leading: CircleAvatar(backgroundColor: HexColor(RgreenGaryColor),child: Icon(Iconsax.receipt_text,size: 25,)),
                trailing: Icon(Iconsax.arrow_circle_right,size: 28,),
              ),
              ListTile(
                title: Text(
                  'Contect US',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,color: isDark?Colors.white60: HexColor(RMidnightBlueColor)),
                ),
                leading: CircleAvatar(backgroundColor: HexColor(RgreenGaryColor),child: Icon(Iconsax.call_calling,size: 27,)),
                trailing: Icon(Iconsax.arrow_circle_right,size: 28,),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ContectUsPage(),));},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(),
              ),
              ListTile(
                title: Text(
                  'Information',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,color: isDark?Colors.white60: HexColor(RMidnightBlueColor)),
                ),
                leading: CircleAvatar(backgroundColor: HexColor(ROrangeGaryColor),child: Icon(Iconsax.information,size: 30,)),
                trailing: Icon(Iconsax.arrow_circle_right,size: 28,),
              ),

              ListTile(
                title: Text(
                  'Logout',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,color: Colors.red),
                ),
                leading: CircleAvatar(backgroundColor: Colors.deepOrange[200],child: Icon(Iconsax.logout,size: 28,)),
                onTap: () async {
                  var sharedPreferene = await SharedPreferences.getInstance();
                  sharedPreferene.setBool(SplashScreenState.KEYLOGIN, false);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
              )
              ,
              Divider( thickness: 0.5),
              Center(child: Text("version 1.0.1")),

            ],
          ),
        ),
      )),
    );
  }
}
