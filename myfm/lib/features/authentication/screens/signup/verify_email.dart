import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/success_screen/success_screen.dart';
import 'package:myfm/features/authentication/screens/login/login.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
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
                'example@myfm.com',
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
              buildContinueBtn(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Resend Email
              buildResendEmailBtn(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildContinueBtn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Get.to(
          () => SucessScreen(
            icon: Iconsax.verify,
            title: TTexts.accountCreatedTitle,
            subtitle: TTexts.accountCreatedSubTitle,
            onPressed: () => Get.to(() => const LoginScreen()),
          ),
        ),
        child: Text(TTexts.tContinue.capitalize!),
      ),
    );
  }

  SizedBox buildResendEmailBtn() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          TTexts.resendEmail,
          // style: TextStyle(
          //   color: Color(0xFFB155AA),
          //   fontSize: 15,
          //   fontWeight: FontWeight.w600,
          // ),
        ),
      ),
    );
  }
}
