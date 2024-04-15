import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/images/circular_image.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const TCircularImage(
                      image: TImages.user,
                      overlayColor: TColors.darkGrey,
                      width: 80,
                      height: 80,
                      padding: 0,
                    ),
                    TextButton(
                      onPressed: () {},
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
              const TSectionHeading(title: 'Profile Information'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Name',
                value: 'Tiago Antunes',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Username',
                value: 'tiagotunes19',
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Personal Info
              const TSectionHeading(title: 'Personal Information'),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'User ID',
                value: '1230321',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Email',
                value: 'example@mail.com',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Nationality',
                value: 'Portuguese',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date of Birth',
                value: '15 Sep, 2000',
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
