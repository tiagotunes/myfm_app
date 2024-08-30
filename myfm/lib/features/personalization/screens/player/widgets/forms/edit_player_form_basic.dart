import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/edit_player_controller.dart';
import 'package:myfm/features/personalization/screens/player/widgets/edit_player_form_page.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/popups/text_form_field_popup.dart';
import 'package:myfm/utils/validators/validation.dart';

class TEditPlayerFormBasic extends StatelessWidget {
  const TEditPlayerFormBasic({super.key});

  @override
  Widget build(BuildContext context) {
    final editPlayerController = Get.put(EditPlayerController());
    return TEditPlayerFormPage(
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
                isRequired: true,
                readOnly: true,
                controller: editPlayerController.dateOfBirth,
                validator: (value) => TValidator.validatePlayerDateOfBirth(
                  value,
                  int.parse(editPlayerController.team.season),
                ),
                onTap: () => TTextFormFieldPopup.selectDate(
                  context,
                  null,
                  null,
                  editPlayerController,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Function
              TTextFormField(
                label: "Function",
                isRequired: true,
                readOnly: true,
                controller: editPlayerController.function,
                validator: (value) => TValidator.validateEmptyText("Function", value),
                onTap: () => TTextFormFieldPopup.selectFunction(
                  context,
                  editPlayerController,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Position
              Obx(
                () => TTextFormField(
                  label: "Position",
                  enabled: editPlayerController.positionEnable.value,
                  isRequired: true,
                  readOnly: true,
                  controller: editPlayerController.position,
                validator: (value) => TValidator.validateEmptyText("Position", value),
                  onTap: () => TTextFormFieldPopup.selectPosition(
                    context,
                    editPlayerController.function.text,
                    editPlayerController,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Role
              Obx(
                () => TTextFormField(
                  label: "Role",
                  enabled: editPlayerController.roleEnable.value,
                  controller: editPlayerController.role,
                  isRequired: false,
                  readOnly: true,
                  onTap: () => TTextFormFieldPopup.selectRole(
                    context,
                    editPlayerController.function.text,
                    editPlayerController.position.text,
                    editPlayerController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
