import 'package:flutter/material.dart';
import 'package:myfm/common/styles/shadows.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildText(context),
          ],
        ),
      ),
    );
  }

  Positioned buildText(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight() + TSizes.defaultSpace * 2,
      child: Column(
        children: [
          buildTitle(context),
          buildSubtitle(context),
        ],
      ),
    );
  }

  Text buildTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontFamily: TTextTheme.fontFamilyIBM,
            color: TColors.textWhite,
            shadows: TShadowStyle.headlineTextShadow,
          ),
      textAlign: TextAlign.center,
    );
  }

  Text buildSubtitle(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontFamily: TTextTheme.fontFamilyIBM,
            color: TColors.textWhite,
            shadows: TShadowStyle.headlineTextShadow,
          ),
      textAlign: TextAlign.center,
    );
  }
}
