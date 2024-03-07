import 'package:av_root_app/src/component/text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/Text/text_wedgets.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchModeValue = false;
  bool _switchNotificationValue = false;
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

  @override
  Widget build(BuildContext context) {


    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [

                Center(child: NameTextWidgets(textName: "Setting")),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170,
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      plant3,
                      alignment: Alignment.centerLeft,
                      height: 210,
                    ),
                  ),
                  Divider( thickness: 0.5),
                  SwitchListTile(
                    title: Text(
                      ' Dark Mode',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  Text(
                    "    Notification",
                    style: TextStyle(fontSize: 18,),
                  ),
                  SwitchListTile(
                    title: Text(
                      'Notifications',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  Text(
                    "    Regional",
                    style: TextStyle(fontSize: 18, ),
                  ),
                  ListTile(
                    title: Text(
                      'Language',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(child: Icon(Iconsax.language_square,size: 30,)),
                    trailing: Icon(Iconsax.arrow_circle_right,size: 28,),
                  ),
                  Divider(color: Colors.black26, thickness: 0.5),
                  ListTile(
                    title: Text(
                      'Information',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,color: isDark?Colors.white60: HexColor(RMidnightBlueColor)),
                    ),
                    leading: CircleAvatar(backgroundColor: HexColor(ROrangeColor),child: Icon(Iconsax.information,size: 30,)),
                    trailing: Icon(Iconsax.arrow_circle_right,size: 28,),
                  ),

                  ListTile(
                    title: Text(
                      'Logout',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,color: Colors.red),
                    ),
                    leading: CircleAvatar(backgroundColor: Colors.deepOrange[200],child: Icon(Iconsax.logout,size: 30,)),

                  )
                  ,
                  Divider( thickness: 0.5),
                    Center(child: Text("version 0.0.1"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
