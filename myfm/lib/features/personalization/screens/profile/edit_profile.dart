import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/icons/action_icon.dart';
import 'package:myfm/common/widgets/text/text_form_field.dart';
import 'package:myfm/features/personalization/controllers/edit_user_controller.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';
import 'package:myfm/utils/validators/validation.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditUserController());
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
            onPressed: () => controller.updateUserData(),
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
                key: controller.editUserFormKey,
                child: Column(
                  children: [
                    // Name
                    TTextFormField(
                      label: TTexts.name,
                      controller: controller.name,
                      validator: (value) =>
                          TValidator.validateEmptyText(TTexts.name, value),
                      isRequired: true,
                      icon: const Icon(Iconsax.user),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Username
                    TTextFormField(
                      label: TTexts.username,
                      controller: controller.username,
                      validator: (value) =>
                          TValidator.validateEmptyText(TTexts.username, value),
                      isRequired: true,
                      icon: const Icon(Iconsax.user_edit),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Nationality
                    TTextFormField(
                      label: TTexts.nationality,
                      controller: controller.nationality,
                      // validator: (value) =>
                      //     TValidator.validateEmptyText(TTexts.nationality, value),
                      isRequired: false,
                      readOnly: true,
                      onTap: () => _selectNation(context, controller),
                      icon: const Icon(Iconsax.flag),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Date of birth
                    TTextFormField(
                      label: TTexts.dob,
                      controller: controller.dateOfBirth,
                      isRequired: false,
                      readOnly: true,
                      onTap: () => _selectDate(context, controller),
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

  Future<void> _selectNation(
      BuildContext context, EditUserController controller) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: THelperFunctions.screenHeight() * 0.25,
      ),
      builder: (context) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Center(
                  child: Text('Nationality ${index + 1}'),
                ),
                onTap: () {
                  controller.nationality.text = 'Nationality ${index + 1}';
                  Navigator.pop(context);
                },
              );
            });
      },
    );
  }

  Future<void> _selectDate(
      BuildContext context, EditUserController controller) async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: controller.dateOfBirth.text != ''
          ? DateTime.parse(controller.dateOfBirth.text)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picker != null) {
      controller.dateOfBirth.text = picker.toString().split(' ')[0];
    }
  }
}
