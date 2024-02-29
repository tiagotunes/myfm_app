import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/image_text/vertical_image_text.dart';
import 'package:myfm/common/widgets/text/section_heading.dart';
import 'package:myfm/utils/constants/sizes.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          // Heading
          const TSectionHeading(
            title: 'Popular categories',
            showActionButton: false,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Categories
          SizedBox(
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return TVerticalImageText(
                  title: 'Category',
                  icon: Icons.handyman_outlined,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
