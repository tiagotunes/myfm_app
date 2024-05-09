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
    this.onTap,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  final String label;
  final String? hintText;
  final bool isRequired, readOnly, obscureText;
  final Widget? icon, icon_;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

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
          onTap: onTap,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: icon,
            suffixIcon: icon_,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
