import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import '../../component/text.dart';
import '../widgets/inputtextformfiled.dart';
import '../widgets/Text/text_wedgets.dart';

class EditProfilePage extends StatefulWidget {

  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var nameController =TextEditingController();
  var mailController =TextEditingController();
  var phoneController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Edit profile",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage("assets/tree/plant2.png"),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: HexColor(RgreenGaryColor),
                          border: Border.all(color: HexColor(ROrangeColor))),
                      child: Icon(Iconsax.camera),
                    ))
              ]),
              SizedBox(height: 20,),
              Form(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  children: [
                    InputTextFormFiledWidgets(lableName: "Full Name",iconData: Iconsax.user,controllerName: nameController,),
                    InputTextFormFiledWidgets(lableName: "Email",iconData: Iconsax.magic_star,controllerName: mailController,),
                    InputTextFormFiledWidgets(lableName: "Contect Number",iconData: Iconsax.mobile,controllerName: phoneController,),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){


                      },
                        child: Text("Update Profile",style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor(RGreenColor),side: BorderSide.none,padding: EdgeInsets.symmetric(vertical: 20)
                      ),),
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text.rich(
                          style: TextStyle(fontSize: 12),
                          TextSpan(text: "Joined",
                              children:[
                                TextSpan(text: " 07 April 2024",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))
                              ] ),

                        ),
                      ],
                    )
                  ],
                ),
              )),


            ],
          ),
        ),
      ),
    );
  }
}
