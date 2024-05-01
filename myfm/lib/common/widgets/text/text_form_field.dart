import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class TTextFormField extends StatelessWidget {
  const TTextFormField({
    super.key,
    required this.label,
    required this.isRequired,
    this.icon,
    this.readOnly = false,
    this.hintText,
    this.icon_,
  });

  final String label;
  final String? hintText;
  final bool isRequired;
  final bool readOnly;
  final IconData? icon, icon_;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRequired ? '${label.toUpperCase()} *' : label.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: TTextTheme.fontFamilyIBM,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: TSizes.spaceBtwLabelInputField),
        TextFormField(
          readOnly: readOnly,
          decoration: icon != null
              ? InputDecoration(
                  prefixIcon: Icon(icon),
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                )
              : icon_ != null
                  ? InputDecoration(
                      suffixIcon: Icon(icon_),
                      hintText: hintText,
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                    )
                  : InputDecoration(
                      hintText: hintText,
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                    ),
        ),
      ],
    );
  }
}
