import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/edit_team_controller.dart';
import 'package:myfm/features/personalization/screens/team/widgets/edit_team_form_page.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TEditTeamFormImages extends StatelessWidget {
  const TEditTeamFormImages({super.key});

  @override
  Widget build(BuildContext context) {
    final editTeamController = Get.put(EditTeamController());
    return TEditTeamFormPage(
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
    );
  }
}
