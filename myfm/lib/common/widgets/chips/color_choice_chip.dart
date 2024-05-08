import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/chips/choice_chip.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/theme/custom_themes/text_theme.dart';

class TColorChoiceChip extends StatelessWidget {
  const TColorChoiceChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.color.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: TTextTheme.fontFamilyIBM,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: TSizes.spaceBtwLabelInputField),
        Wrap(
          // spacing: 8,
          children: List.generate(
            TTexts.formColors.length,
            (index) => TChoiceChip(
              text: TTexts.formColors[index],
              selected: TTexts.formColors[index] == "Green" ? true : false,
              onSelected: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}
