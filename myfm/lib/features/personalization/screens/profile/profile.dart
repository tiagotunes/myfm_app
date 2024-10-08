import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/images/circular_image.dart';
import 'package:myfm/common/widgets/loaders/shimmer.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/features/personalization/screens/profile/edit_profile.dart';
import 'package:myfm/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final countryController = CountryController.instance;
    final userController = UserController.instance;
    final user = userController.user;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        centerTitle: false,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = user.value.profilePicture;
                      final image = networkImage!.isNotEmpty
                          ? networkImage
                          : TImages.user;
                      return userController.imageUploading.value
                          ? const TShimmerEffect(
                              width: 120,
                              height: 120,
                              radius: 120,
                            )
                          : TCircularImage(
                              image: image,
                              width: 120,
                              height: 120,
                              padding: 0,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => userController.uploadProfilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              // Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Profile Info
              TSectionHeading(
                title: 'Personal Information',
                showActionButton: true,
                buttonTitle: 'Edit Profile',
                onPressed: () => Get.to(() => const TEditProfileScreen()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Obx(
                () => TProfileMenu(
                  title: 'Name',
                  value: user.value.name != "" ? user.value.name : "...",
                  onPressed: () {},
                ),
              ),
              Obx(
                () => TProfileMenu(
                  title: 'Username',
                  value:
                      user.value.username != "" ? user.value.username : "...",
                  onPressed: () {},
                ),
              ),
              Obx(
                /*() => TProfileMenu(
                  title: 'Nationality',
                  value: user.value.nationality != null
                      ? countryController
                          .allCountries[int.parse(user.value.nationality!) - 1]
                          .nationality
                      : "...",
                  onPressed: () {},
                ),*/
                () {
                  if (user.value.nationality != null) {
                    return TProfileMenu(
                      title: 'Nationality',
                      value: countryController
                          .allCountries[int.parse(user.value.nationality!) - 1]
                          .nationality,
                      onPressed: () {},
                    );
                  }
                  return const SizedBox();
                },
              ),

              Obx(
                () {
                  if (user.value.dateOfBirth != null) {
                    return TProfileMenu(
                      title: 'Date of Birth',
                      value: user.value.dateOfBirth!,
                      onPressed: () {},
                    );
                  }
                  return const SizedBox();
                },
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Personal Info
              const TSectionHeading(title: 'Account Information'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'User ID',
                value: user.value.id,
                icon: const Icon(Iconsax.copy),
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Email',
                value: user.value.email,
                onPressed: () {},
              ),

              // const SizedBox(height: TSizes.spaceBtwItems),
              // const Divider(),
              // const SizedBox(height: TSizes.spaceBtwItems),

              // Center(
              //   child: TextButton(
              //     onPressed: () {},
              //     child: const Text(
              //       'Close account',
              //       style: TextStyle(color: Colors.red),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
