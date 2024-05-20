import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TTextFormField(
                  label: TTexts.email,
                  isRequired: true,
                  controller: controller.verifyEmail,
                  validator: TValidator.validateEmail,
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Obx(
                  () => TTextFormField(
                    label: TTexts.password,
                    isRequired: true,
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        TValidator.validateEmptyText(TTexts.password, value),
                    icon_: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(
                        controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthenticateEmailAndPassword(),
                    child: const Text('Verify'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
