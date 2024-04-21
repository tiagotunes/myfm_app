import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/images/rounded_image.dart';
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
            // Team Images
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: TSizes.sm),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    TRoundedImage(
                      height: 200,
                      width: 300,
                      fit: BoxFit.fitHeight,
                      imageUrl: controller.imageCurrentIndex.value == 0
                          ? teamLogo
                          : controller.imageCurrentIndex.value == 1
                              ? teamKit
                              : teamStadium,
                    ),
                    controller.imageCurrentIndex.value == 2
                        ? Positioned(
                            bottom: 0,
                            child: Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: TColors.dark.withOpacity(0.6)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Iconsax.location),
                                  SizedBox(width: TSizes.spaceBtwItems / 2),
                                  Text('Estádio José Alvalade XXI')
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),

            // Icon button - onTap update image
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
