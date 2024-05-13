import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/data/repositories/authentication/authentication_repository.dart';
import 'package:myfm/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(Icons.close_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Icon(
                Iconsax.direct_inbox,
                size: THelperFunctions.screenWidth() * 0.5,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                TTexts.verifyEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.verifyEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Buttons
              // Continue
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: Text(TTexts.tContinue.capitalize!),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Resend Email
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(
                    TTexts.resendEmail,
                    // style: TextStyle(
                    //   color: Color(0xFFB155AA),
                    //   fontSize: 15,
                    //   fontWeight: FontWeight.w600,
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
