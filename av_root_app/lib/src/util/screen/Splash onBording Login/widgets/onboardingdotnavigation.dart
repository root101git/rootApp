import 'package:av_root_app/src/Coontroller/onboardingcontroller.dart';
import 'package:av_root_app/src/component/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: 65,
        left: 20,
        child: SmoothPageIndicator(
            effect: ExpandingDotsEffect(
                activeDotColor: HexColor(RGreenColor), dotHeight: 6),
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick ,
            count: 3));
  }
}
