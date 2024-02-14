import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/text_form_field.dart';
import 'package:myfm/features/authentication/screens/signup/verify_email.dart';
import 'package:myfm/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // E-mail
          const TTextFormField(
            label: TTexts.email,
            isRequired: true,
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          const TTextFormField(
            label: TTexts.password,
            isRequired: true,
            icon: Icons.password,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Name
          const TTextFormField(
            label: TTexts.name,
            isRequired: true,
            icon: Icons.person_outline_rounded,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Nationality
          const TTextFormField(
            label: TTexts.nationality,
            isRequired: true,
            icon: Icons.flag_outlined,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Date of birth
          const TTextFormField(
            label: TTexts.dob,
            isRequired: false,
            icon: Icons.calendar_today_outlined,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Terms & Conditions Checkbox
          const TTermsAndConditionsCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
