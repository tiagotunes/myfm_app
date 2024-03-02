import 'package:flutter/material.dart';
import 'package:myfm/common/styles/spacing_styles.dart';
import 'package:myfm/common/widgets/login_signup/form_divider.dart';
import 'package:myfm/common/widgets/login_signup/social_buttons.dart';
import 'package:myfm/features/authentication/screens/login/widgets/login_form.dart';
import 'package:myfm/features/authentication/screens/login/widgets/login_header.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Header -> Logo, Title & Subtitle
              TLoginHeader(),

              // Form
              TLoginForm(),

              // Divider
              TFormDivider(text: TTexts.orSignInWith),
              SizedBox(height: TSizes.spaceBtwSections),

              // Footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
