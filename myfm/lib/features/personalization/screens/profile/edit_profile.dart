import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/icons/action_icon.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/features/personalization/controllers/edit_user_controller.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/popups/text_form_field_popup.dart';
import 'package:myfm/utils/validators/validation.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editUserController = Get.put(EditUserController());
    final countryController = Get.put(CountryController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        centerTitle: false,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          // Save
          ActionIcon(
            onPressed: () => editUserController.updateUserData(),
            icon: Iconsax.user_tick,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headings
              Text(
                'Use real name for easy verification. This name will appear on several pages.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Text fields
              Form(
                key: editUserController.editUserFormKey,
                child: Column(
                  children: [
                    // Name
                    TTextFormField(
                      label: TTexts.name,
                      controller: editUserController.name,
                      validator: (value) =>
                          TValidator.validateEmptyText(TTexts.name, value),
                      isRequired: true,
                      icon: const Icon(Iconsax.user),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Username
                    TTextFormField(
                      label: TTexts.username,
                      controller: editUserController.username,
                      validator: (value) =>
                          TValidator.validateEmptyText(TTexts.username, value),
                      isRequired: true,
                      icon: const Icon(Iconsax.user_edit),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Nationality
                    TTextFormField(
                      label: TTexts.nationality,
                      controller: editUserController.nationality,
                      isRequired: false,
                      readOnly: true,
                      onTap: () => TTextFormFieldPopup.selectNation(
                        context,
                        null,
                        editUserController,
                        countryController,
                      ),
                      icon: const Icon(Iconsax.flag),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Date of birth
                    TTextFormField(
                      label: TTexts.dob,
                      controller: editUserController.dateOfBirth,
                      validator: (value) =>
                          TValidator.validateDateOfBirth(value),
                      isRequired: false,
                      readOnly: true,
                      onTap: () => TTextFormFieldPopup.selectDate(
                        context,
                        null,
                        editUserController,
                      ),
                      icon: const Icon(Iconsax.calendar_1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
