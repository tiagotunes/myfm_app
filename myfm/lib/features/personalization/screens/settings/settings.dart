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
import 'package:myfm/utils/constants/text_strings.dart';

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
                      TTexts.settings,
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
                  const TSectionHeading(
                      title: "${TTexts.account} ${TTexts.settings}"),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                    icon: Iconsax.bookmark,
                    title: TTexts.saved,
                    subtitle: 'Check your personal colletion',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: TTexts.notifications,
                    subtitle: 'Set any kind of notification message',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: TTexts.privacy,
                    subtitle: 'Control your account privacy',
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // App Settings
                  const TSectionHeading(
                      title: "${TTexts.app} ${TTexts.settings}"),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                    icon: Iconsax.translate,
                    title: TTexts.language,
                    subtitle: 'English',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.dollar_circle,
                    title: TTexts.currency,
                    subtitle: 'Euro',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.moneys,
                    title: TTexts.wageDisplay,
                    subtitle: 'Monthly',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.moon,
                    title: TTexts.theme,
                    subtitle: 'Dark',
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.finger_cricle,
                    title: TTexts.biometricAuth,
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
                        side: WidgetStateProperty.resolveWith<BorderSide?>(
                          (Set<WidgetState> states) {
                            return const BorderSide(color: TColors.darkGrey);
                          },
                        ),
                      ),
                      child: const Text(TTexts.logout),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Close account Button
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        
                        OutlinedButton(
                          onPressed: () => controller.deleteAccountWarningPopup(),
                          style:
                              Theme.of(context).outlinedButtonTheme.style!.copyWith(
                            side: WidgetStateProperty.resolveWith<BorderSide?>(
                              (Set<WidgetState> states) {
                                return const BorderSide(color: Colors.red);
                              },
                            ),
                          ),
                          child: const Text(
                            TTexts.closeAccount,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
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
