import 'package:av_root_app/src/Coontroller/onboardingcontroller.dart';
import 'package:flutter/material.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40,
        right: 10,
        child: TextButton(
          onPressed: ()=> OnBoardingController.instance.skipPage(),
          child: Text("Skip"),
        ));
  }
}