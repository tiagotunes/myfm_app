import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/chips/choice_chip.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/screens/team/widgets/team_form_page.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class TTeamFormPageView extends StatelessWidget {
  const TTeamFormPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CarouselSlider(
        items: const [
          // Page 1 - Basic
          TeamFormPage(
            bottomLabel: 'Basic',
            formFields: Column(
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
                  label: 'Country',
                  isRequired: true,
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                // Season Year
                TTextFormField(
                  label: 'Season Year',
                  isRequired: true,
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                // Stadium Name
                TTextFormField(
                  label: 'Stadium Name',
                  isRequired: false,
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                TColorChoiceChip()
              ],
            ),
          ),

          // Page 2 - Finances
          TeamFormPage(
            bottomLabel: 'Finances',
            formFields: Column(
              children: [
                // Bank Balance
                TTextFormField(
                  label: 'Bank Balance',
                  isRequired: false,
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                // Squad Budget
                TTextFormField(
                  label: 'Squad Budget',
                  isRequired: false,
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                // Wage Budget
                TTextFormField(
                  label: 'Wage Budget',
                  isRequired: false,
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
              ],
            ),
          ),

          // Page 3 - Images
          TeamFormPage(
            bottomLabel: 'Images',
            formFields: Column(children: [
              TTextFormField(
                label: 'Logo',
                isRequired: false,
                readOnly: true,
                hintText: 'Choose image',
                icon_: Icons.cancel,
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              TTextFormField(
                label: 'Kit',
                isRequired: false,
                readOnly: true,
                hintText: 'Choose image',
                icon_: Icons.cancel,
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              TTextFormField(
                label: 'Stadium',
                isRequired: false,
                readOnly: true,
                hintText: 'Choose image',
                icon_: Icons.cancel,
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
            ]),
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

class TColorChoiceChip extends StatelessWidget {
  const TColorChoiceChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'COLOR',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: TTextTheme.fontFamilyIBM,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: TSizes.spaceBtwLabelInputField),
        Wrap(
          children: [
            TChoiceChip(
              text: 'White',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Yellow',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Orange',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Pink',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Red',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Green',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Blue',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Purple',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Black',
              selected: true,
              onSelected: (value) {},
            ),
          ],
        )
      ],
    );
  }
}
