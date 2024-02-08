import 'package:flutter/material.dart';
import 'package:myfm/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
