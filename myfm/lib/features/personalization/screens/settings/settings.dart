import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:myfm/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:myfm/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/data/repositories/authentication/authentication_repository.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/features/personalization/screens/profile/profile.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
                      'Settings',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),

                  // User Profile Card
                  TUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
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
                    icon: Iconsax.bookmark,
                    title: 'Saved',
                    subtitle: 'Check your personal colletion',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Account Privacy',
                    subtitle: 'Control your account privacy',
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // App Settings
                  const TSectionHeading(title: 'App Settings'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                    icon: Iconsax.translate,
                    title: 'Language',
                    subtitle: 'English',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.dollar_circle,
                    title: 'Currency',
                    subtitle: 'Euro',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.moneys,
                    title: 'Wage Display Format',
                    subtitle: 'Monthly',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.moon,
                    title: 'Theme',
                    subtitle: 'Dark',
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.finger_cricle,
                    title: 'Biometric Authentication',
                    subtitle: 'Sign in with your unique identity',
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
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
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
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Close account Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      style:
                          Theme.of(context).outlinedButtonTheme.style!.copyWith(
                        side: MaterialStateProperty.resolveWith<BorderSide?>(
                          (Set<MaterialState> states) {
                            return const BorderSide(color: Colors.red);
                          },
                        ),
                      ),
                      child: const Text(
                        'Close account',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
