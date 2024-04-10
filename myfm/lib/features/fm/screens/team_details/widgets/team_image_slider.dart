import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/features/fm/controllers/team_image_controller.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTeamImageSlider extends StatelessWidget {
  const TTeamImageSlider({
    super.key,
    required this.teamLogo,
    required this.teamKit,
    required this.teamStadium,
  });

  final String teamLogo, teamKit, teamStadium;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: TSizes.sm),
                child: Image(
                  image: AssetImage(
                    controller.imageCurrentIndex.value == 0
                        ? teamLogo
                        : controller.imageCurrentIndex.value == 1
                            ? teamKit
                            : teamStadium,
                  ),
                  height: 200,
                ),
              ),
            ),
            Positioned(
              top: TSizes.sm,
              right: TSizes.md,
              child: GestureDetector(
                onTap: () => controller
                    .updateImageIndicator(controller.imageCurrentIndex.value),
                child: TRoundedContainer(
                  radius: 5,
                  padding: const EdgeInsets.all(TSizes.sm),
                  backgroundColor: TColors.darkerGrey.withOpacity(0.8),
                  child: Obx(
                    () => controller.imageCurrentIndex.value == 0
                        ? const Icon(Iconsax.shield, size: TSizes.iconSm)
                        : controller.imageCurrentIndex.value == 1
                            ? const Icon(Iconsax.gallery, size: TSizes.iconSm)
                            : const Icon(Iconsax.map, size: TSizes.iconSm),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
