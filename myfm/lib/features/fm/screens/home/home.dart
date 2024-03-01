import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:myfm/common/widgets/layouts/grid_layout.dart';
import 'package:myfm/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:myfm/features/fm/screens/home/widgets/banner_slider.dart';
import 'package:myfm/features/fm/screens/home/widgets/home_appbar.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Search bar
                  TSearchContainer(text: TTexts.search),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Scrollable categories
                  // THomeCategories()

                  // Banners
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace,
                    ),
                    child: TBannerSlider(),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections * 1.5),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const TProductCardVertical(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
