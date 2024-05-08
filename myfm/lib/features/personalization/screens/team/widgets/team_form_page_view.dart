import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/chips/color_choice_chip.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/screens/team/widgets/team_form_page.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTeamFormPageView extends StatelessWidget {
  const TTeamFormPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CarouselSlider(
        items: [
          // Page 1 - Basic
          TeamFormPage(
            bottomLabel: TTexts.basic.capitalize,
            formFields: SizedBox(
              height: TSizes.formFieldHeight,
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    TTextFormField(
                      label: TTexts.name,
                      isRequired: true,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    // Country
                    TTextFormField(
                      label: TTexts.country,
                      isRequired: true,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    // Season Year
                    TTextFormField(
                      label: TTexts.season,
                      isRequired: true,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    // Stadium Name
                    TTextFormField(
                      label: "${TTexts.stadium} ${TTexts.name}",
                      isRequired: false,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    // Color
                    TColorChoiceChip()
                  ],
                ),
              ),
            ),
          ),

          // Page 2 - Finances
          TeamFormPage(
            bottomLabel: TTexts.finances.capitalize,
            formFields: SizedBox(
              height: TSizes.formFieldHeight,
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    // Bank Balance
                    TTextFormField(
                      label: TTexts.bankBalance,
                      isRequired: false,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    // Squad Budget
                    TTextFormField(
                      label: TTexts.squadBudget,
                      isRequired: false,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    // Wage Budget
                    TTextFormField(
                      label: TTexts.wageBudget,
                      isRequired: false,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                  ],
                ),
              ),
            ),
          ),

          // Page 3 - Images
          TeamFormPage(
            bottomLabel: TTexts.images.capitalize,
            formFields: SizedBox(
              height: TSizes.formFieldHeight,
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    TTextFormField(
                      label: TTexts.logo,
                      isRequired: false,
                      readOnly: true,
                      hintText: TTexts.chooseImage,
                      icon_: Icons.cancel,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    TTextFormField(
                      label: TTexts.kit,
                      isRequired: false,
                      readOnly: true,
                      hintText: TTexts.chooseImage,
                      icon_: Icons.cancel,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    TTextFormField(
                      label: TTexts.stadium,
                      isRequired: false,
                      readOnly: true,
                      hintText: TTexts.chooseImage,
                      icon_: Icons.cancel,
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
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
