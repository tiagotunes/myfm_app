import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/images/circular_image.dart';
import 'package:myfm/common/widgets/text/flag_label_text_with_icon.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/enums.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TUserCard extends StatelessWidget {
  const TUserCard({
    super.key,
    this.showBorder = true,
  });

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Image
            Flexible(
              child: TCircularImage(
                image: TImages.user,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TFlagLabelWithIconText(
                    label: 'User',
                    labelSize: TextSizes.large,
                  ),
                  Text(
                    '123 followers',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
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
