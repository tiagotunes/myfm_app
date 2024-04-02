import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:myfm/features/fm/screens/home/widgets/banner_slider.dart';
import 'package:myfm/features/fm/screens/home/widgets/home_appbar.dart';
import 'package:myfm/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Banners
                  TBannerSlider(),
                  SizedBox(height: TSizes.spaceBtwSections * 1.5),
                ],
              ),
            ),

            // Body
          ],
        ),
      ),
    );
  }
}
