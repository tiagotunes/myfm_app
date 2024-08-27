import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/chips/color_choice_chip.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/edit_team_controller.dart';
import 'package:myfm/features/personalization/screens/team/widgets/edit_team_form_page.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';
import 'package:myfm/utils/popups/text_form_field_popup.dart';
import 'package:myfm/utils/validators/validation.dart';

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
        items: [
          // Page 1 - Basic
          TEditTeamFormPage(
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
                      controller: editTeamController.name,
                      validator: (value) =>
                          TValidator.validateEmptyText(TTexts.name, value),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Country
                    TTextFormField(
                      label: TTexts.country,
                      isRequired: true,
                      readOnly: true,
                      controller: editTeamController.country,
                      validator: (value) =>
                          TValidator.validateEmptyText(TTexts.country, value),
                      onTap: () => TTextFormFieldPopup.selectNation(
                        context,
                        null,
                        null,
                        editTeamController,
                        null,
                        editTeamController.countryController,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Season Year
                    TTextFormField(
                      label: TTexts.season,
                      isRequired: true,
                      inputType: TextInputType.number,
                      controller: editTeamController.season,
                      validator: (value) =>
                          TValidator.validateEmptyText(TTexts.season, value),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Stadium Name
                    TTextFormField(
                      label: "${TTexts.stadium} ${TTexts.name}",
                      isRequired: false,
                      controller: editTeamController.stadiumName,
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Color
                    const TColorChoiceChip()
                  ],
                ),
              ),
            ),
          ),

          // Page 2 - Finances
          TEditTeamFormPage(
            bottomLabel: TTexts.finances.capitalize,
            formFields: SizedBox(
              height: TSizes.formFieldHeight,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Bank Balance
                    TTextFormField(
                      label: TTexts.bankBalance,
                      isRequired: false,
                      controller: editTeamController.bankBalance,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Squad Budget
                    TTextFormField(
                      label: TTexts.squadBudget,
                      isRequired: false,
                      controller: editTeamController.squadBudget,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    // Wage Budget
                    TTextFormField(
                      label: TTexts.wageBudget,
                      isRequired: false,
                      controller: editTeamController.wageBudget,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                  ],
                ),
              ),
            ),
          ),

          // Page 3 - Images
          TEditTeamFormPage(
            bottomLabel: TTexts.images.capitalize,
            formFields: SizedBox(
              height: TSizes.formFieldHeight,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TTextFormField(
                      label: TTexts.logo,
                      isRequired: false,
                      readOnly: true,
                      hintText: TTexts.chooseImage,
                      icon_: GestureDetector(
                        onTap: () {
                          editTeamController.logoImg.clear();
                          editTeamController.logoImgPath.clear();
                        },
                        child: const Icon(Icons.cancel),
                      ),
                      controller: editTeamController.logoImg,
                      onTap: () => editTeamController.chooseImage('logo'),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TTextFormField(
                      label: TTexts.kit,
                      isRequired: false,
                      readOnly: true,
                      hintText: TTexts.chooseImage,
                      icon_: GestureDetector(
                        onTap: () {
                          editTeamController.kitImg.clear();
                          editTeamController.kitImgPath.clear();
                        },
                        child: const Icon(Icons.cancel),
                      ),
                      controller: editTeamController.kitImg,
                      onTap: () => editTeamController.chooseImage('kit'),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TTextFormField(
                      label: TTexts.stadium,
                      isRequired: false,
                      readOnly: true,
                      hintText: TTexts.chooseImage,
                      icon_: GestureDetector(
                        onTap: () {
                          editTeamController.stadiumImg.clear();
                          editTeamController.stadiumImgPath.clear();
                        },
                        child: const Icon(Icons.cancel),
                      ),
                      controller: editTeamController.stadiumImg,
                      onTap: () => editTeamController.chooseImage('stadium'),
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
