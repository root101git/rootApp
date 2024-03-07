import 'package:av_root_app/src/authentication/login_signup/loginscreen.dart';
import 'package:av_root_app/src/util/Theme/theme.dart';
import 'package:av_root_app/src/util/screen/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AVTheme.lightTheme,
        darkTheme: AVTheme.darkTheme,
        home: NavigationMenu());
  }
}
