import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/text/flag_label_text.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/enums.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TFlagLabelWithIconText extends StatelessWidget {
  const TFlagLabelWithIconText({
    super.key,
    required this.label,
    this.maxLines = 1,
    this.textColor,
    this.textAlign = TextAlign.center,
    this.labelSize = TextSizes.small,
    this.iconColor = TColors.primary,
  });

  final String label;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes labelSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TFlagLabelText(
            label: label,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            labelSize: labelSize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        const Icon(
          Icons.flag,
          // color: iconColor,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}
