
import 'package:av_root_app/src/modele/user_modele.dart';
import 'package:av_root_app/src/repository/user_repository.dart';
import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/UI helper/uphelper.dart';
import '../navigation_menu.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userMailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameComtroller = TextEditingController();
  final TextEditingController _phoneComtroller = TextEditingController();

   final userRepo = Get.put(UserRepository());


  signup(String email, String password) async {
    if (email == "" && password == "") {
      UiHlper.CoustomAlertBox(context, "Enter value");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                )));
      } on FirebaseAuthException catch (e) {
        return UiHlper.CoustomAlertBox(context, e.code.toString());
      }
    }
  }

  Future<void> createUser(UserModele userModele) async {
    await userRepo.createUser(userModele);
    signup(userModele.email, userModele.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Signup",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              UiHlper.costomeTextFilde(_nameComtroller, "Name", Iconsax.user, false),
              UiHlper.costomeTextFilde(
                  _userMailController, " mail", Icons.mail_outline, false),
              UiHlper.costomeTextFilde(_phoneComtroller, "Phone number", Iconsax.mobile, false),
              UiHlper.costomeTextFilde(_passwordController, "Passsword",
                  Iconsax.password_check, true),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    print("h\n\n\n\n Signup button \n\n\n\n ");

                    final user = UserModele(
                        fullName: _nameComtroller.text.toString(),
                        email: _userMailController.text.toString(),
                        phoneNo: _phoneComtroller.text.toString(),
                        password: _passwordController.text.toString());

                   createUser(user);
                  },
                  child: Text("Signup")),
              Row(
                children: [
                  Text("i have account"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("login"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
