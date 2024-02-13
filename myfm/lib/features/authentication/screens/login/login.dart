import 'package:flutter/material.dart';
import 'package:myfm/common/styles/spacing_styles.dart';
import 'package:myfm/common/widgets/login_signup/form_divider.dart';
import 'package:myfm/common/widgets/login_signup/social_buttons.dart';
import 'package:myfm/features/authentication/screens/login/widgets/login_form.dart';
import 'package:myfm/features/authentication/screens/login/widgets/login_header.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Header -> Logo, Title & Subtitle
              TLoginHeader(dark: dark),

              // Form
              const TLoginForm(),

              // Divider
              const TFormDivider(text: TTexts.orSignInWith),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
