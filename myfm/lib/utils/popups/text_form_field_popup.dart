import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/features/authentication/controllers/signup/signup_controller.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/features/personalization/controllers/edit_user_controller.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTextFormFieldPopup {
  static Future<void> selectNation(
    BuildContext context,
    SignupController? signupController,
    EditUserController? editUserController,
    CountryController countryController,
  ) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: THelperFunctions.screenHeight() * 0.4,
      ),
      builder: (context) {
        return Obx(() {
          if (countryController.isLoading.value) {
            return Center(
              child: Text(
                'Loading...',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          if (countryController.activeCountries.isEmpty) {
            return Center(
              child: Text(
                'No countries found',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: countryController.activeCountries.length,
            itemBuilder: (context, index) {
              final country = countryController.activeCountries[index];
              return ListTile(
                leading: country.flag != ''
                    ? SvgPicture.asset(
                        country.flag,
                        width: 33,
                      )
                    : const Icon(Iconsax.flag),
                title: Text(country.nationality),
                //title: Text('${country.id} ${country.nationality}')
                onTap: () {
                  if (signupController != null) {
                    signupController.nationality.text = country.nationality;
                    signupController.nationalityID.text = country.id;
                  }
                  if (editUserController != null) {
                    editUserController.nationality.text = country.nationality;
                    editUserController.nationalityID.text = country.id;
                  }
                  Navigator.pop(context);
                },
              );
            },
          );
        });
      },
    );
  }

  static Future<void> selectDate(
    BuildContext context,
    SignupController? signupController,
    EditUserController? editUserController,
  ) async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate:
          signupController != null && signupController.dateOfBirth.text != ''
              ? DateTime.parse(signupController.dateOfBirth.text)
              : editUserController != null &&
                      editUserController.dateOfBirth.text != ''
                  ? DateTime.parse(editUserController.dateOfBirth.text)
                  : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picker != null) {
      if (signupController != null) {
        signupController.dateOfBirth.text = picker.toString().split(' ')[0];
      }
      if (editUserController != null) {
        editUserController.dateOfBirth.text = picker.toString().split(' ')[0];
      }
    }
  }
}
