import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/chips/choice_chip.dart';
import 'package:myfm/utils/constants/sizes.dart';
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
          'COLOR',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: TTextTheme.fontFamilyIBM,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: TSizes.spaceBtwLabelInputField),
        Wrap(
          // spacing: 8,
          children: [
            TChoiceChip(
              text: 'White',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Yellow',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Orange',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Pink',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Red',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Green',
              selected: true,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Blue',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Purple',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'Black',
              selected: false,
              onSelected: (value) {},
            ),
            TChoiceChip(
              text: 'customColor',
              selected: false,
              onSelected: (value) {},
            ),
          ],
        )
      ],
    );
  }
}
