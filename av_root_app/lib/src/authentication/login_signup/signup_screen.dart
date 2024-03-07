
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../util/screen/navigation_menu.dart';
import '../../util/widgets/UI helper/uphelper.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userMailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  builder: (context) => NavigationMenu(),
                )));
      } on FirebaseAuthException catch (e) {
        return UiHlper.CoustomAlertBox(context, e.code.toString());
      }
    }
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
              UiHlper.costomeTextFilde(
                  _userMailController, " mail", Iconsax.user, false),
              UiHlper.costomeTextFilde(_passwordController, "Passsword",
                  Iconsax.password_check, true),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    print("h\n\n\n\n Signup button \n\n\n\n ");
                    signup(_userMailController.text.toString(),
                        _passwordController.text.toString());
                  },
                  child: Text("Signup")),
              Row(
                children: [
                  Text("i have account"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("sinup"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
