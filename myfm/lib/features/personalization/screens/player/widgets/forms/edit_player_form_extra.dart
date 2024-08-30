import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/edit_player_controller.dart';
import 'package:myfm/features/personalization/screens/player/widgets/edit_player_form_page.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class TEditPlayerFormExtra extends StatelessWidget {
  const TEditPlayerFormExtra({super.key});

  @override
  Widget build(BuildContext context) {
    final editPlayerController = Get.put(EditPlayerController());
    return TEditPlayerFormPage(
      bottomLabel: "Extra",
      formFields: SizedBox(
        height: TSizes.formFieldHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current Ability
              TTextFormField(
                label: "Current Ability",
                isRequired: false,
                controller: editPlayerController.ca,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Potential Ability
              TTextFormField(
                label: "Potential Ability",
                isRequired: false,
                controller: editPlayerController.pa,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Number
              TTextFormField(
                label: "Number",
                isRequired: false,
                controller: editPlayerController.number,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Height
              TTextFormField(
                label: "Height",
                isRequired: false,
                controller: editPlayerController.height,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Foot
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Foot".toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: TTextTheme.fontFamilyIBM,
                          fontWeight: FontWeight.bold,
                          color: TColors.white,
                        ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwLabelInputField),
                  buildFootRow(context, editPlayerController, true),
                  buildFootRow(context, editPlayerController, false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Obx buildFootRow(
    BuildContext context,
    EditPlayerController editPlayerController,
    bool flip,
  ) {
    return Obx(
      () => Row(
        children: [
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: flip
                  ? editPlayerController.footL.value
                  : editPlayerController.footR.value,
              onChanged: (value) => flip
                  ? editPlayerController.footL.value = value!
                  : editPlayerController.footR.value = value!,
            ),
          ),
          Transform.flip(
            flipX: flip,
            child: SvgPicture.asset(
              TImages.foot,
              height: TSizes.iconMd,
              colorFilter: ColorFilter.mode(
                flip && editPlayerController.footL.value
                    ? Colors.white
                    : !flip && editPlayerController.footR.value
                        ? Colors.white
                        : Colors.white.withOpacity(0.3),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwLabelInputField * 1.7),
          Text(
            flip ? "Left" : "Right",
            style: Theme.of(context).textTheme.labelMedium,
          )
        ],
      ),
    );
  }
}
