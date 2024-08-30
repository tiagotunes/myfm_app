import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/edit_team_controller.dart';
import 'package:myfm/features/personalization/screens/team/widgets/edit_team_form_page.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class TEditTeamFormFinances extends StatelessWidget {
  const TEditTeamFormFinances({super.key});

  @override
  Widget build(BuildContext context) {
    final editTeamController = Get.put(EditTeamController());
    return TEditTeamFormPage(
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
    );
  }
}
