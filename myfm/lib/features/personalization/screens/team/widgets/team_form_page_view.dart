import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTeamFormPageView extends StatelessWidget {
  const TTeamFormPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: TSizes.defaultSpace * 2,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.red),
            child: Center(child: Text('data')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: TSizes.defaultSpace * 2,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.green),
            child: Center(child: Text('data')),
          ),
        )
      ],
      options: CarouselOptions(
        enableInfiniteScroll: false,
        height: THelperFunctions.screenHeight(),
      ),
    );
  }
}
