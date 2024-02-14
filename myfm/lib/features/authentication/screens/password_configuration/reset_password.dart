import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/features/authentication/screens/login/login.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close_rounded),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // Image
            Icon(
              Icons.verified_user_outlined,
              size: THelperFunctions.screenWidth() * 0.5,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Title & Subtitle
            Text(
              TTexts.passwordResetTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.passwordResetSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const LoginScreen()),
                child: Text(TTexts.done.capitalize!),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  TTexts.resendEmail,
                  style: TextStyle(
                    color: Color(0xFFB155AA),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
