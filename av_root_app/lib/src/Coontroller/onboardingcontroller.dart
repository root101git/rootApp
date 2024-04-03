import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  final pageController  = PageController();
  Rx<int> curentPageIndex = 0.obs;



  void updatePageIndicator(index)=> curentPageIndex = index;

  void dotNavigationClick(index){
    curentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage(){
   if(curentPageIndex.value == 2 ){
    Get.to(LoginScreen());
   }else{
     int page = curentPageIndex.value + 1;
     pageController.jumpToPage(page);
   }
  }

  void skipPage(){
     Get.to(LoginScreen());
  }

}