import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/features/personalization/controllers/edit_team_controller.dart';
import 'package:myfm/utils/constants/colors.dart';
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
        /*Wrap(
          // spacing: 8,
          children: List.generate(
            TTexts.formColors.length,
            (index) => Obx(
              () => TChoiceChip(
                text: TTexts.formColors[index],
                selected: TTexts.formColors[index] !=
                        editTeamController.color.obs.toString()
                    ? false
                    : true,
                onSelected: (value) => editTeamController.color.value =
                    (editTeamController.color.value == TTexts.formColors[index])
                        ? ""
                        : TTexts.formColors[index],
              ),
            ),
          ),
        ),*/
        Obx(
          () => ColorIndicator(
            color: editTeamController.color.value != null
                ? Color(editTeamController.color.value!)
                : Colors.transparent,
            width: double.infinity,
            height: 50,
            borderRadius: TSizes.borderRadiusMd,
            borderColor: TColors.inputFieldBackground,
            hasBorder: true,
            onSelect: () {
              ColorPicker(
                color: editTeamController.color.value != null
                    ? Color(editTeamController.color.value!)
                    : const Color(4294198070),
                onColorChanged: (color) {
                  // print(color.value);
                  editTeamController.color.value = color.value;
                },
                pickersEnabled: const <ColorPickerType, bool>{
                  ColorPickerType.both: false,
                  ColorPickerType.primary: true,
                  ColorPickerType.accent: false,
                  ColorPickerType.bw: false,
                  ColorPickerType.custom: false,
                  ColorPickerType.wheel: true,
                },
                heading: const Text('Select color'),
                subheading: const Text('Select color shade'),
                enableShadesSelection: true,
                includeIndex850: true,
                actionButtons: const ColorPickerActionButtons(
                  // dialogCancelButtonLabel: 'Close',
                  // dialogCancelButtonType: ColorPickerActionButtonType.outlined,
                  // dialogOkButtonLabel: 'Ok',
                  // dialogOkButtonType: ColorPickerActionButtonType.elevated,
                  dialogActionButtons: false,
                ),
                borderRadius: TSizes.borderRadiusMd,
                wheelDiameter: 230,
                wheelWidth: 25,
                wheelSquarePadding: TSizes.sm,
                wheelSquareBorderRadius: TSizes.borderRadiusMd,
                wheelHasBorder: true,
                wheelSubheading: const Text('Select color shade'),
                showColorCode: true,
                copyPasteBehavior: const ColorPickerCopyPasteBehavior(
                  copyFormat: ColorPickerCopyFormat.numHexRRGGBB,
                ),
              ).showPickerDialog(context);
            },
          ),
        )
      ],
    );
  }
}
