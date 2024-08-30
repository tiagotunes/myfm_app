import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
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
    this.onTap,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.inputType,
    this.enabled = true,
    this.chip,
  });

  final String label;
  final String? hintText;
  final bool isRequired, readOnly, obscureText, enabled;
  final Widget? icon, icon_, chip;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;

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
                color: enabled || chip != null
                    ? TColors.white
                    : TColors.white.withOpacity(0.4),
              ),
        ),
        const SizedBox(height: TSizes.spaceBtwLabelInputField),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextFormField(
                enabled: enabled,
                readOnly: readOnly,
                onTap: onTap,
                controller: controller,
                validator: validator,
                keyboardType: inputType,
                obscureText: obscureText,
                decoration: InputDecoration(
                  prefixIcon: icon,
                  suffixIcon: icon_,
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  fillColor: enabled
                      ? Theme.of(context).inputDecorationTheme.fillColor
                      : Theme.of(context)
                          .inputDecorationTheme
                          .fillColor!
                          .withOpacity(0.4),
                ),
              ),
            ),
            chip ?? const SizedBox(),
          ],
        ),
      ],
    );
  }
}
