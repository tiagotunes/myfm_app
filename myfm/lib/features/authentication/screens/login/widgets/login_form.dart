import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/authentication/controllers/login/login_controller.dart';
import 'package:myfm/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:myfm/features/authentication/screens/signup/signup.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            // Email
            TTextFormField(
              label: TTexts.email,
              controller: controller.email,
              isRequired: true,
              validator: (value) => TValidator.validateEmail(value),
              // icon: Icons.email_outlined,
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            Obx(
              () => TTextFormField(
                label: TTexts.password,
                controller: controller.password,
                isRequired: true,
                obscureText: controller.hidePassword.value,
                validator: (value) => TValidator.validateEmptyText(
                  TTexts.password,
                  value,
                ),
                icon_: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
                // icon: Icons.password_outlined,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Remeber me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(TTexts.remeberMe),
                  ],
                ),
                buildForgetPasswordTxtBtn(context),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(TTexts.signIn),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Create Account Button
            buildCreateAccountBtn(),
          ],
        ),
      ),
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
