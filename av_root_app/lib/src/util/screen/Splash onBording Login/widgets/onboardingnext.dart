import 'package:av_root_app/src/Coontroller/onboardingcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../component/text.dart';

class OnBoardingNext extends StatelessWidget {
  const OnBoardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 45,
        right: 20,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: HexColor(RGreenColor),
              shape: CircleBorder()),
          onPressed: () => OnBoardingController.instance.nextPage(),
          child: Icon(
            Iconsax.arrow_right_34,
            color: Colors.black,
          ),
        ));
  }
}