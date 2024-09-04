import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/authentication/controllers/signup/signup_controller.dart';
import 'package:myfm/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/popups/text_form_field_popup.dart';
import 'package:myfm/utils/validators/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    final countryController = Get.put(CountryController());
    return Form(
      key: signupController.signupFormKey,
      child: Column(
        children: [
          // Name
          TTextFormField(
            label: TTexts.name,
            controller: signupController.name,
            validator: (value) =>
                TValidator.validateEmptyText(TTexts.name, value),
            isRequired: true,
            icon: const Icon(Iconsax.user),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Username
          TTextFormField(
            label: TTexts.username,
            controller: signupController.username,
            validator: (value) =>
                TValidator.validateEmptyText(TTexts.username, value),
            isRequired: true,
            icon: const Icon(Iconsax.user_edit),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // E-mail
          TTextFormField(
            label: TTexts.email,
            controller: signupController.email,
            validator: (value) => TValidator.validateEmail(value),
            isRequired: true,
            icon: const Icon(Iconsax.sms),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          Obx(
            () => TTextFormField(
              label: TTexts.password,
              controller: signupController.password,
              validator: (value) => TValidator.validatePassword(value),
              isRequired: true,
              obscureText: signupController.hidePassword.value,
              icon: const Icon(Iconsax.password_check),
              icon_: IconButton(
                onPressed: () => signupController.hidePassword.value =
                    !signupController.hidePassword.value,
                icon: Icon(
                  signupController.hidePassword.value
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
            controller: signupController.nationality,
            isRequired: false,
            readOnly: true,
            onTap: () => TTextFormFieldPopup.selectNation(
              context,
              signupController,
              null,
              null,
              null,
              countryController,
            ), // _selectNation(context, controller),
            icon: const Icon(Iconsax.flag),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Date of birth
          TTextFormField(
            label: TTexts.dob,
            controller: signupController.dateOfBirth,
            isRequired: false,
            readOnly: true,
            onTap: () => TTextFormFieldPopup.selectDate(
              context,
              signupController,
              null,
              null,
            ),
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
              onPressed: () => signupController.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
