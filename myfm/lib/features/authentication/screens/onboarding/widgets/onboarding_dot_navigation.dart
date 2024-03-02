import 'package:flutter/material.dart';
import 'package:myfm/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: SmoothPageIndicator(
        count: controller.nPages,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: const ExpandingDotsEffect(
          activeDotColor: TColors.primary,
          dotColor: TColors.grey,
          dotWidth: 8,
          dotHeight: 6,
        ),
      ),
    );
  }
}
