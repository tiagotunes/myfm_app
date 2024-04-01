import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/enums.dart';

class TFlagLabelText extends StatelessWidget {
  const TFlagLabelText({
    super.key,
    required this.label,
    this.maxLines = 1,
    this.color,
    this.textAlign = TextAlign.center,
    this.labelSize = TextSizes.small,
  });

  final Color? color;
  final String label;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes labelSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: labelSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : labelSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : labelSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
