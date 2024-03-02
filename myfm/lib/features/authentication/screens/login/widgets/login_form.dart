import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/text_form_field.dart';
import 'package:myfm/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:myfm/features/authentication/screens/signup/signup.dart';
import 'package:myfm/navigation_menu.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            // Email
            const TTextFormField(
              label: TTexts.email,
              isRequired: true,
              // icon: Icons.email_outlined,
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            const TTextFormField(
              label: TTexts.password,
              isRequired: true,
              // icon: Icons.password_outlined,
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Remeber me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRemeberMeCheckBox(),
                buildForgetPasswordTxtBtn(context),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Sign In Button
            buildSignInBtn(),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Create Account Button
            buildCreateAccountBtn(),
          ],
        ),
      ),
    );
  }

  Row buildRemeberMeCheckBox() {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
        ),
        const Text(TTexts.remeberMe),
      ],
    );
  }

  TextButton buildForgetPasswordTxtBtn(BuildContext context) {
    return TextButton(
      onPressed: () => Get.to(() => const ForgetPasswordScreen()),
      child: Text(
        TTexts.forgetPassword,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  SizedBox buildSignInBtn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Get.to(() => const NavigationMenu()),
        child: const Text(TTexts.signIn),
      ),
    );
  }

  SizedBox buildCreateAccountBtn() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => Get.to(() => const SignupScreen()),
        child: const Text(TTexts.createAccount),
      ),
    );
  }
}
