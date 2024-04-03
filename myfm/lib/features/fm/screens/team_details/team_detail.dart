import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              wDiagonalRect: true,
              child: Column(
                children: [
                  // AppBar
                  TAppBar(
                    showBackArrow: true,
                    title: Text(
                      'Sporting CP'.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Team Logo
                  const Image(
                    image: AssetImage(TImages.scp),
                    height: 225,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 1.5)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
