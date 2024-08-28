import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/features/personalization/controllers/edit_player_controller.dart';
import 'package:myfm/features/personalization/screens/player/widgets/forms/edit_player_fom_basic.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TEditPlayerFormPageView extends StatelessWidget {
  const TEditPlayerFormPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final editPlayerController = Get.put(EditPlayerController());
    return Form(
      key: editPlayerController.editPlayerFormKey,
      child: CarouselSlider(
        items: const [
          // Page 1 - Basic
          TEditPlayerFormBasic(),
        ],
        options: CarouselOptions(
          enableInfiniteScroll: false,
          height: THelperFunctions.screenHeight() -
              TDeviceUtils.getAppBarHeight() -
              TDeviceUtils.getStatusBarHeight(),
        ),
      ),
    );
  }
}
