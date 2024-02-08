import 'package:flutter/material.dart';
import 'package:myfm/utils/device/device_utility.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;
  static List<Shadow> shadows = const [
    Shadow(offset: Offset(0, 1), blurRadius: 5)
  ];

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
      top: TDeviceUtils.getScreenHeight() * 0.12,
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
            fontFamily: 'IBM Plex Sans',
            color: Colors.white,
            shadows: shadows,
          ),
      textAlign: TextAlign.center,
    );
  }

  Text buildSubtitle(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontFamily: 'IBM Plex Sans',
            color: Colors.white,
            shadows: shadows,
          ),
      textAlign: TextAlign.center,
    );
  }
}
