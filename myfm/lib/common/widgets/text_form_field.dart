import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class TTextFormField extends StatelessWidget {
  const TTextFormField({
    super.key,
    required this.label,
    required this.isRequired,
    required this.icon,
  });

  final String label;
  final bool isRequired;
  final IconData icon;

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
            // decoration: InputDecoration(
            //   prefixIcon: Icon(icon),
            // ),
            ),
      ],
    );
  }
}
