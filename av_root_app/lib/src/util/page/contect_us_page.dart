import 'package:av_root_app/src/component/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/Container/contectus_container.dart';

class ContectUsPage extends StatelessWidget {
  const ContectUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contect US",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  Customer Support  😊😊😊
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? HexColor(RBlackColor)
                            : Colors.greenAccent.shade100,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: isDark ? Colors.black12 : Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customer Support",
                        style: TextStyle(
                            fontSize: 20,
                            color:
                                isDark ? Colors.lightBlue[50] : Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          launch('tel:+91 7440685025');
                        },
                        child: ContectUsContainerWidgets(
                            iconData: FontAwesomeIcons.squarePhoneFlip,
                            nameSubTitle: "+91 7440685025",
                            nameTitle: "Contect Number"),
                      ),
                      InkWell(
                        onTap: () {
                          launch(
                              'mailto:stockmarket.org.in@gmail.com?subject= =community');
                        },
                        child: ContectUsContainerWidgets(
                            iconData: Icons.mail,
                            nameSubTitle: "stockmarket.org.in",
                            nameTitle: "Email Address"),
                      ),
                    ],
                  ),
                ),
              ),
              //  Customer Support  😊😊😊
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? HexColor(RBlackColor)
                            : Colors.greenAccent.shade100,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: isDark ? Colors.black12 : Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Social Media",
                        style: TextStyle(
                            fontSize: 20,
                            color:
                                isDark ? Colors.lightBlue[50] : Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          launch(
                              "https://www.instagram.com/rupesh_rahangdale_?igsh=ajd6Mnd4dzk5eHU0");
                        },
                        child: ContectUsContainerWidgets(
                            iconData: FontAwesomeIcons.squareInstagram,
                            nameSubTitle: "@rupesh_rahangdale_",
                            nameTitle: "Instagram"),
                      ),
                      InkWell(
                        onTap: () {
                          launch(
                              'https://x.com/codewithrupesh?t=ne0dKUqTqf1rmIurASz77g&s=08');
                        },
                        child: ContectUsContainerWidgets(
                            iconData: FontAwesomeIcons.squareXTwitter,
                            nameSubTitle: "@codewithrupesh",
                            nameTitle: "Twitter"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
