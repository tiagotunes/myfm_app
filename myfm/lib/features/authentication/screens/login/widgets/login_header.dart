import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 150,
            image: AssetImage(
              dark ? TImages.darkAppLogo : TImages.lightAppLogo,
            ),
          ),
          Text(
            TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: TSizes.sm),
          Text(
            TTexts.loginSubTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
