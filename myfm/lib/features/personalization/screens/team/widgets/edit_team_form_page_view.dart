import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/features/personalization/controllers/edit_team_controller.dart';
import 'package:myfm/features/personalization/screens/team/widgets/forms/edit_team_form_basic.dart';
import 'package:myfm/features/personalization/screens/team/widgets/forms/edit_team_form_finances.dart';
import 'package:myfm/features/personalization/screens/team/widgets/forms/edit_team_form_images.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TEditTeamFormPageView extends StatelessWidget {
  const TEditTeamFormPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final editTeamController = Get.put(EditTeamController());
    return Form(
      key: editTeamController.editTeamFormKey,
      child: CarouselSlider(
        items: const [
          // Page 1 - Basic
          TEditTeamFormBasic(),

          // Page 2 - Finances
          TEditTeamFormFinances(),

          // Page 3 - Images
          TEditTeamFormImages(),
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

