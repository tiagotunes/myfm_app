import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/images/circular_image.dart';
import 'package:myfm/common/widgets/loaders/shimmer.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/features/personalization/screens/profile/edit_profile.dart';
import 'package:myfm/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : TCircularImage(
                              image: image,
                              overlayColor: TColors.darkGrey,
                              width: 80,
                              height: 80,
                              padding: 0,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadProfilePicture(),
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
                onPressed: () => Get.to(() => const EditProfileScreen()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Name',
                value: controller.user.value.name,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Nationality',
                value: controller.user.value.nationality,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date of Birth',
                value: controller.user.value.dateOfBirth,
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Personal Info
              const TSectionHeading(title: 'Account Information'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: const Icon(Iconsax.copy),
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
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
