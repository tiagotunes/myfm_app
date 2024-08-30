import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/edit_player_controller.dart';
import 'package:myfm/features/personalization/screens/player/widgets/edit_player_form_page.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TEditPlayerFormContract extends StatelessWidget {
  const TEditPlayerFormContract({super.key});

  @override
  Widget build(BuildContext context) {
    final editPlayerController = Get.put(EditPlayerController());
    return TEditPlayerFormPage(
      bottomLabel: "Contract",
      formFields: SizedBox(
        height: TSizes.formFieldHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Value
              TTextFormField(
                label: "Value",
                isRequired: false,
                controller: editPlayerController.value,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Wage
              TTextFormField(
                label: "Wage",
                isRequired: false,
                controller: editPlayerController.wage,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Release clause
              TTextFormField(
                label: "Release Clause",
                isRequired: false,
                controller: editPlayerController.releaseClause,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // On Loan
              Obx(
                () => TTextFormField(
                  label: "On Loan",
                  isRequired: false,
                  enabled: editPlayerController.onLoan.value,
                  hintText: "Loan from",
                  chip: Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                        value: editPlayerController.onLoan.value,
                        onChanged: (value) {
                          editPlayerController.onLoan.value = value!;
                          if (value) {
                            editPlayerController.loaned.value = false;
                            // editPlayerController.loanedTo.text = "";
                          }
                        }),
                  ),
                  controller: editPlayerController.loanFrom,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              // Loaned
              Obx(
                () => TTextFormField(
                  label: "Loaned",
                  isRequired: false,
                  enabled: editPlayerController.loaned.value,
                  hintText: "Loaned to",
                  chip: Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                        value: editPlayerController.loaned.value,
                        onChanged: (value) {
                          editPlayerController.loaned.value = value!;
                          if (value) {
                            editPlayerController.onLoan.value = false;
                            // editPlayerController.loanFrom.text = "";
                          }
                        }),
                  ),
                  controller: editPlayerController.loanedTo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
