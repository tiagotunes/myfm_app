import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/images/circular_image.dart';
import 'package:myfm/common/widgets/loaders/shimmer.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Obx(
      () {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage ?? TImages.user;
        return ListTile(
          leading: controller.imageUploading.value
              ? const TShimmerEffect(
                  width: 50,
                  height: 50,
                  radius: 50,
                )
              : TCircularImage(
                  image: image,
                  width: 50,
                  height: 50,
                  padding: 0,
                  isNetworkImage: networkImage != null,
                ),
          title: Text(
            controller.user.value.name,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
          subtitle: Text(
            '@${controller.user.value.username}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white),
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Iconsax.edit,
              color: TColors.white,
            ),
          ),
        );
      },
    );
  }
}
