import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:myfm/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:myfm/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  TAppBar(
                    centerTitle: false,
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),

                  // User Profile Card
                  const TUserProfileTile(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Settings
                  const TSectionHeading(title: 'Account Settings'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                    icon: Iconsax.attach_circle,
                    title: 'Title',
                    subtitle: 'Subtitle',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.attach_circle,
                    title: 'Title',
                    subtitle: 'Subtitle',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.attach_circle,
                    title: 'Title',
                    subtitle: 'Subtitle',
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // App Settings
                  const TSectionHeading(title: 'App Settings'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                    icon: Iconsax.attach_circle,
                    title: 'Title',
                    subtitle: 'Subtitle',
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.attach_circle,
                    title: 'Title',
                    subtitle: 'Subtitle',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style:
                          Theme.of(context).outlinedButtonTheme.style!.copyWith(
                        side: MaterialStateProperty.resolveWith<BorderSide?>(
                          (Set<MaterialState> states) {
                            return const BorderSide(color: TColors.darkGrey);
                          },
                        ),
                      ),
                      child: const Text('Logout'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
