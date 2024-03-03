import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:myfm/common/widgets/images/rounded_images.dart';
import 'package:myfm/features/fm/controllers/banner_controller.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TBannerSlider extends StatelessWidget {
  const TBannerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              aspectRatio: 4 / 1,
              // autoPlay: true,
              onPageChanged: (index, _) =>
                  controller.updateBannerIndicator(index),
            ),
            items: [
              TRoundedImage(
                imageUrl: TImages.bannerImage[0],
                width: double.infinity,
                backgroundColor: Colors.black,
              ),
              TRoundedImage(
                imageUrl: TImages.bannerImage[1],
                width: double.infinity,
                padding: const EdgeInsets.all(TSizes.lg),
                fit: BoxFit.contain,
              ),
              TRoundedImage(
                imageUrl: TImages.bannerImage[2],
                width: double.infinity,
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < TImages.bannerImage.length; i++)
                    TCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i
                              ? TColors.grey
                              : TColors.darkGrey,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
