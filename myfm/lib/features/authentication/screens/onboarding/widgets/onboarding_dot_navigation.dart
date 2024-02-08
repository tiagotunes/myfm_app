import 'package:flutter/material.dart';
import 'package:myfm/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getScreenHeight() * 0.25,
      child: SmoothPageIndicator(
        count: 4,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light : TColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
