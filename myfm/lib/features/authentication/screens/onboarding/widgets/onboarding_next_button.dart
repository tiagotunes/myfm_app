import 'package:flutter/material.dart';
import 'package:myfm/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: Icon(icon),
      ),
    );
  }
}
