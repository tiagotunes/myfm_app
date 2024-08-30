import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/chips/color_choice_chip.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/edit_team_controller.dart';
import 'package:myfm/features/personalization/screens/team/widgets/edit_team_form_page.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/popups/text_form_field_popup.dart';
import 'package:myfm/utils/validators/validation.dart';

class TEditTeamFormBasic extends StatelessWidget {
  const TEditTeamFormBasic({super.key});

  @override
  Widget build(BuildContext context) {
    final editTeamController = Get.put(EditTeamController());
    return TEditTeamFormPage(
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
    );
  }
}
