import 'dart:ui';

import 'package:av_root_app/src/component/text.dart';
import 'package:av_root_app/src/modele/user_modele.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModele user) async {
    await _db.collection("user").add(user.toJson()).whenComplete(
          () => Get.snackbar("Sucess", "You account has beer created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: HexColor(RGreenColor),
              colorText: HexColor(RgreenGaryColor)),
        ).catchError((error, stackTrace){
      Get.snackbar("Error", "Something went Wrong. try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.5),
          colorText: Colors.red);
    });
  }
}
