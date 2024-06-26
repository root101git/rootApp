import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/signup_screen.dart';
import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/splash_screen.dart';
import 'package:av_root_app/src/util/widgets/UI%20helper/uphelper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigationMenu(),
                )));
        print("logedin \n dashbord");
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

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationMenu(),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userMailController.dispose();
    _passwordController.dispose();
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
                    onPressed: () async {
                      print("\n\n\n\n Login button \n\n\n\n  ");
                      login(_userMailController.text.toString(),
                          _passwordController.text.toString());
                      var sharedPreferene =
                          await SharedPreferences.getInstance();
                      sharedPreferene.setBool(SplashScreenState.KEYLOGIN, true);


                    },
                    child: Text("login")),
                Row(
                  children: [
                    Text("i don't have account"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: Text("sinup"))
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      loginWithGoogle();
                      var sharedPreferene =
                          await SharedPreferences.getInstance();
                      sharedPreferene.setBool(SplashScreenState.KEYLOGIN, true);
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
