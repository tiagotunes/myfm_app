import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:myfm/common/widgets/images/rounded_image.dart';
import 'package:myfm/common/widgets/loaders/shimmer.dart';
import 'package:myfm/features/fm/controllers/banner_controller.dart';
import 'package:myfm/utils/constants/colors.dart';
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
      child: Obx(
        () {
          if (controller.isLoading.value) {
            return const TShimmerEffect(width: double.infinity, height: 190);
          }
          if (controller.banners.isEmpty) {
            return Center(
              child: Text(
                'No Data Found',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            );
          }
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  aspectRatio: 4 / 1.4,
                  // autoPlay: true,
                  onPageChanged: (index, _) =>
                      controller.updateBannerIndicator(index),
                ),
                items: controller.banners
                    .map((b) => TRoundedImage(
                          imageUrl: b.imageUrl,
                          isNetworkImage: true,
                          width: double.infinity,

                          // onPressed: () => Get.toNamed(b.targetScreen),
                        ))
                    .toList(),
                // [
                // TRoundedImage(
                //   imageUrl: TImages.bannerImage[0],
                //   width: double.infinity,
                //   backgroundColor: TColors.black,
                //   border: Border.all(color: TColors.grey, width: 5),
                // ),
                // TRoundedImage(
                //   imageUrl: TImages.bannerImage[1],
                //   width: double.infinity,
                //   backgroundColor: TColors.white,
                //   padding: const EdgeInsets.all(TSizes.lg),
                //   fit: BoxFit.contain,
                // ),
                // TRoundedImage(
                //   imageUrl: TImages.bannerImage[2],
                //   width: double.infinity,
                // ),
                // ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
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
          );
        },
      ),
    );
  }
}
