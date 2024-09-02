import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myfm/common/widgets/text/label_text.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/enums.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TLabelWithIconText extends StatelessWidget {
  const TLabelWithIconText({
    super.key,
    required this.country,
    this.countryId,
    this.label,
    this.icon = Iconsax.flag,
    this.maxLines = 1,
    this.textColor,
    this.textAlign = TextAlign.center,
    this.labelSize = TextSizes.small,
    this.iconColor = TColors.primary,
  });

  final bool country;
  final int? countryId;
  final String? label;
  final IconData icon;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes labelSize;

  @override
  Widget build(BuildContext context) {
    final countryController = Get.put(CountryController());
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TLabelText(
            label: country && countryId != null
                ? countryController.allCountries[countryId! - 1].name
                : countryId != null
                    ? ""
                    : label!,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            labelSize: labelSize,
          ),
        ),
        const SizedBox(width: TSizes.sm),
        countryId != null
            ? SvgPicture.asset(
                countryController.allCountries[countryId! - 1].flag,
                height: 20,
              )
            : Icon(
                icon,
                // color: iconColor,
                size: TSizes.iconXs,
              ),
      ],
    );
  }
}
