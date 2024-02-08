import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:myfm/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:myfm/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:myfm/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: List<OnBoardingPage>.generate(
              4,
              (index) => OnBoardingPage(
                image: TImages.onBoardingImage[index],
                title: TTexts.onBoardingTitle[index],
                subtitle: TTexts.onBoardingSubTitle[index],
              ),
            ),
          ),

          // Dot Navigation SmoothPageIndicator
          // const OnBoardingNavigation(),

          // Next Button
          const OnBoardingNextButton(),

          // Skip Button
          const OnBoardingSkip(),
        ],
      ),
    );
  }
}
