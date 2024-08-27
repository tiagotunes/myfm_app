import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/features/authentication/controllers/signup/signup_controller.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/features/personalization/controllers/edit_player_controller.dart';
import 'package:myfm/features/personalization/controllers/edit_team_controller.dart';
import 'package:myfm/features/personalization/controllers/edit_user_controller.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TTextFormFieldPopup {
  static Future<void> selectNation(
    BuildContext context,
    SignupController? signupController,
    EditUserController? editUserController,
    EditTeamController? editTeamController,
    EditPlayerController? editPlayerController,
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
            itemCount: countryController.activeCountriesOrderNationality.length,
            itemBuilder: (context, index) {
              final country = editTeamController != null
                  ? countryController.activeCountries[index]
                  : countryController.activeCountriesOrderNationality[index];
              return ListTile(
                leading: country.flag != ''
                    ? SvgPicture.asset(
                        country.flag,
                        width: 33,
                      )
                    : const Icon(Iconsax.flag),
                title: Text(
                  editTeamController != null
                      ? country.name
                      : country.nationality,
                ),
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
                  if (editTeamController != null) {
                    editTeamController.country.text = country.name;
                    editTeamController.countryID.text = country.id;
                  }
                  if (editPlayerController != null) {
                    editPlayerController.nationality.text = country.nationality;
                    editPlayerController.nationalityID.text = country.id;
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
      EditPlayerController? editPlayerController) async {
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
      if (editPlayerController != null) {
        editPlayerController.dateOfBirth.text = picker.toString().split(' ')[0];
      }
    }
  }

  static Future<void> selectRole(
      BuildContext context, EditPlayerController? editPlayerController) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: THelperFunctions.screenHeight() * 0.4,
      ),
      builder: (context) {
        return Wrap(
          children: TTexts.positionsRoles.entries.map((e) {
            return ListTile(
              leading: SvgPicture.asset(
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                e.value["icon"].toString(),
              ),
              title: Text(e.key),
              onTap: () {
                editPlayerController!.role.text = e.key;
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  static Future<void> selectPosition(
      BuildContext context, String role, EditPlayerController? editPlayerController) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: THelperFunctions.screenHeight() * 0.4,
      ),
      builder: (context) {
        return Wrap(
          children: TTexts.positionsRoles.entries.map((e) {
            return ListTile(
              leading: SvgPicture.asset(
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                e.value["icon"].toString(),
              ),
              title: Text(e.key),
              onTap: () {
                editPlayerController!.role.text = e.key;
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
