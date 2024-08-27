import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/edit_player_controller.dart';
import 'package:myfm/features/personalization/screens/player/widgets/edit_player_form_page.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';
import 'package:myfm/utils/popups/text_form_field_popup.dart';
import 'package:myfm/utils/validators/validation.dart';

class TEditPlayerFormPageView extends StatelessWidget {
  const TEditPlayerFormPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final editPlayerController = Get.put(EditPlayerController());
    return Form(
      key: editPlayerController.editPlayerFormKey,
      child: CarouselSlider(
        items: [
          // Page 1 - Basic
          TEditPlayerFormPage(
            bottomLabel: TTexts.basic.capitalize,
            formFields: SizedBox(
              height: TSizes.formFieldHeight,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    TTextFormField(
                      label: TTexts.name,
                      isRequired: true,
                      controller: editPlayerController.name,
                      validator: (value) =>
                          TValidator.validateEmptyText(TTexts.name, value),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Nationality
                    TTextFormField(
                      label: TTexts.country,
                      isRequired: true,
                      readOnly: true,
                      controller: editPlayerController.nationality,
                      validator: (value) =>
                          TValidator.validateEmptyText(TTexts.country, value),
                      onTap: () => TTextFormFieldPopup.selectNation(
                        context,
                        null,
                        null,
                        null,
                        editPlayerController,
                        editPlayerController.countryController,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Date of birth
                    TTextFormField(
                      label: TTexts.dob,
                      controller: editPlayerController.dateOfBirth,
                      isRequired: true,
                      readOnly: true,
                      onTap: () => TTextFormFieldPopup.selectDate(
                        context,
                        null,
                        null,
                        editPlayerController,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Position
                    TTextFormField(
                      label: "Role",
                      controller: editPlayerController.role,
                      isRequired: true,
                      readOnly: true,
                      onTap: () => TTextFormFieldPopup.selectRole(
                        context,
                        editPlayerController,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Position
                    TTextFormField(
                      label: "Position",
                      enabled: false,
                      controller: editPlayerController.position,
                      isRequired: true,
                      readOnly: true,
                      onTap: () => TTextFormFieldPopup.selectPosition(
                        context,
                        editPlayerController.role.text,
                        editPlayerController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
