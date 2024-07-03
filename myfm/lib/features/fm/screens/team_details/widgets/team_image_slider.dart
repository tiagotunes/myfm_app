import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/images/rounded_image.dart';
import 'package:myfm/features/fm/controllers/team_image_controller.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTeamImageSlider extends StatelessWidget {
  const TTeamImageSlider({
    super.key,
    required this.team,
  });

  final TeamModel team;

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
                    controller.imageCurrentIndex.value == 0
                        ? buildTeamLogo(controller)
                        : controller.imageCurrentIndex.value == 1
                            ? buildTeamKit(controller)
                            : buildTeamStadium(controller),
                    controller.imageCurrentIndex.value == 2 &&
                            team.stadiumName.isNotEmpty
                        ? Positioned(
                            bottom: 0,
                            child: Container(
                              width: 300,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: TColors.dark.withOpacity(0.6)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Iconsax.location,
                                    color: TColors.darkGrey,
                                  ),
                                  const SizedBox(
                                      width: TSizes.spaceBtwItems / 2),
                                  Text(team.stadiumName)
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

  Widget buildTeamLogo(ImageController controller) {
    if (team.logo.isEmpty) {
      return SvgPicture.asset(
        'assets/icons/shield.svg',
        height: 200,
        width: 300,
        colorFilter: ColorFilter.mode(
          // team.color.isEmpty ? Colors.white : Colors.green,
          team.color == null ? Colors.white : Color(team.color!),
          BlendMode.srcIn,
        ),
      );
    } else {
      return TRoundedImage(
        height: 200,
        width: 300,
        fit: BoxFit.fitHeight,
        isNetworkImage: true,
        imageUrl: team.logo,
        onPressed: () => controller.showEnlargedImage(team.logo),
      );
    }
  }

  Widget buildTeamKit(ImageController controller) {
    if (team.kit.isEmpty) {
      return SizedBox(
        width: 300,
        height: 200,
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/shirt.svg',
            height: 130,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2),
              BlendMode.srcIn,
            ),
          ),
        ),
      );
    } else {
      return TRoundedImage(
        height: 200,
        width: 300,
        fit: BoxFit.fitHeight,
        isNetworkImage: true,
        imageUrl: team.kit,
        onPressed: () => controller.showEnlargedImage(team.kit),
      );
    }
  }

  Widget buildTeamStadium(ImageController controller) {
    if (team.stadiumImg.isEmpty) {
      return SizedBox(
        width: 300,
        height: 200,
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/stadium.svg',
            height: 130,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2),
              BlendMode.srcIn,
            ),
          ),
        ),
      );
    } else {
      return TRoundedImage(
        height: 200,
        width: 300,
        fit: BoxFit.fitHeight,
        isNetworkImage: true,
        imageUrl: team.stadiumImg,
        onPressed: () => controller.showEnlargedImage(team.stadiumImg),
      );
    }
  }
}
