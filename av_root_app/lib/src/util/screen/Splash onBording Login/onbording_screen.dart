import 'package:av_root_app/src/component/text.dart';
import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/widgets/onboardingdotnavigation.dart';
import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/widgets/onboardingnext.dart';
import 'package:av_root_app/src/util/screen/Splash%20onBording%20Login/widgets/onboardingskip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Coontroller/onboardingcontroller.dart';
import 'widgets/onboardingpage.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: [
            OnBoardingPage(
              title: 'Welcome to Plantify!',
              subTitle: 'Your plant identification companion',
              image: onBoardingIMG1,
            ),
            OnBoardingPage(
              title: 'Discover Plants!',
              subTitle: 'Identify and learn about plants around you',
              image: onBoardingIMG2,
            ),
            OnBoardingPage(
              title: 'Get Started!',
              subTitle: 'Begin exploring the world of plants',
              image: onBoardingIMG3,
            ),
          ],
        ),
        onBoardingSkip(),
        OnBoardingDotNavigation(),
        OnBoardingNext()
      ],
    ));
  }
}
