import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/signup_screen.dart';
import 'package:av_root_app/src/util/widgets/UI%20helper/uphelper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';

import '../navigation_menu.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userMailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  login(String email, String password) async {
    if (email == "" && password == "") {
      UiHlper.CoustomAlertBox(context, "Enter value");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
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

  loginWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken);

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);
  }

  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => SignUpScreen())
        : user.emailVerified
            ? Get.offAll(() => LoginScreen())
            : Get.offAll(() => NavigationMenu());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                UiHlper.costomeTextFilde(
                    _userMailController, " mail", Iconsax.user, false),
                UiHlper.costomeTextFilde(_passwordController, "Passsword",
                    Iconsax.password_check, true),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      print("\n\n\n\n Login button \n\n\n\n  ");

                      login(_userMailController.text.toString(),
                          _passwordController.text.toString());
                    },
                    child: Text("login")),
                Row(
                  children: [
                    Text("i don't have account"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: Text("sinup"))
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      loginWithGoogle();
                    },
                    child: Icon(FontAwesomeIcons.google))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
