import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/chips/choice_chip.dart';
import 'package:myfm/features/personalization/controllers/edit_team_controller.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class TColorChoiceChip extends StatelessWidget {
  const TColorChoiceChip({super.key});

  @override
  Widget build(BuildContext context) {
    final editTeamController = Get.put(EditTeamController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.color.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: TTextTheme.fontFamilyIBM,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: TSizes.spaceBtwLabelInputField),
        Wrap(
          // spacing: 8,
          children: List.generate(
            TTexts.formColors.length,
            (index) => Obx(
              () => TChoiceChip(
                text: TTexts.formColors[index],
                selected: TTexts.formColors[index] !=
                            editTeamController.color.obs.toString() ||
                        TTexts.formColors[index] == "customColor"
                    ? false
                    : true,
                onSelected: (value) {
                  // print(editTeamController.color.obs.toString());
                  editTeamController.color.value = TTexts.formColors[index];
                  // print(editTeamController.color.obs.toString());
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
