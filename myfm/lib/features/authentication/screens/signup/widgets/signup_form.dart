import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/authentication/controllers/signup/signup_controller.dart';
import 'package:myfm/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';
import 'package:myfm/utils/validators/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // Name
          TTextFormField(
            label: TTexts.name,
            controller: controller.name,
            validator: (value) =>
                TValidator.validateEmptyText(TTexts.name, value),
            isRequired: true,
            icon: const Icon(Iconsax.user),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Username
          TTextFormField(
            label: TTexts.username,
            controller: controller.username,
            validator: (value) =>
                TValidator.validateEmptyText(TTexts.username, value),
            isRequired: true,
            icon: const Icon(Iconsax.user_edit),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // E-mail
          TTextFormField(
            label: TTexts.email,
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            isRequired: true,
            icon: const Icon(Iconsax.sms),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          Obx(
            () => TTextFormField(
              label: TTexts.password,
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              isRequired: true,
              obscureText: controller.hidePassword.value,
              icon: const Icon(Iconsax.password_check),
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
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Nationality
          TTextFormField(
            label: TTexts.nationality,
            controller: controller.nationality,
            // validator: (value) =>
            //     TValidator.validateEmptyText(TTexts.nationality, value),
            isRequired: false,
            readOnly: true,
            onTap: () => _selectNation(context, controller),
            icon: const Icon(Iconsax.flag),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Date of birth
          TTextFormField(
            label: TTexts.dob,
            controller: controller.dateOfBirth,
            isRequired: false,
            readOnly: true,
            onTap: () => _selectDate(context, controller),
            icon: const Icon(Iconsax.calendar_1),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Terms & Conditions Checkbox
          const TTermsAndConditionsCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectNation(
      BuildContext context, SignupController controller) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: THelperFunctions.screenHeight() * 0.25,
      ),
      builder: (context) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Center(
                  child: Text('Nationality ${index + 1}'),
                ),
                onTap: () {
                  controller.nationality.text = 'Nationality ${index + 1}';
                  Navigator.pop(context);
                },
              );
            });
      },
    );
  }

  Future<void> _selectDate(
      BuildContext context, SignupController controller) async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: controller.dateOfBirth.text != ''
          ? DateTime.parse(controller.dateOfBirth.text)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picker != null) {
      controller.dateOfBirth.text = picker.toString().split(' ')[0];
    }
  }
}
