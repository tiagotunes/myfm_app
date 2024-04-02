import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/cards/user/user_card.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TUserShowCase extends StatelessWidget {
  const TUserShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkerGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.sm),
      child: Column(
        children: [
          // User
          const TUserCard(showBorder: false),

          // User Teams
          Row(
            children: images
                .map((img) => userTopTeamImageWidget(img, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget userTopTeamImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
