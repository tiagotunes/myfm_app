import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/loaders/shimmer.dart';
import 'package:myfm/common/widgets/text/appbar_title_text.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      centerTitle: false,
      title: Obx(
        () {
          if (controller.profileLoading.value) {
            return const TShimmerEffect(width: 80, height: 15);
          } else {
            return TAppBarTitleText(
              title: 'Coach ${controller.user.value.name}',
              subtitle: 'Welcome back,',
            );
          }
        },
      ),
      /*actions: [
        TCounterIcon(
          onPressed: () {},
          iconColor: TColors.white,
          icon: Iconsax.message_text_15,
          count: '2',
        )
      ],*/
    );
  }
}
