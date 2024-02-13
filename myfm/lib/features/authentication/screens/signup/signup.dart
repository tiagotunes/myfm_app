import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/login_signup/form_divider.dart';
import 'package:myfm/common/widgets/login_signup/social_buttons.dart';
import 'package:myfm/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                TTexts.createAccountTitle,
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                      fontFamily: TTextTheme.fontFamilyIBM,
                    ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Form
              const TSignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Divider
              const TFormDivider(text: TTexts.orSignUpWith),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
