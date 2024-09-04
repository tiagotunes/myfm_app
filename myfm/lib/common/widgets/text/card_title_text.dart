import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TCardTitleText extends StatelessWidget {
  const TCardTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.isName = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.textColor = TColors.white,
  });

  final String title;
  final bool smallSize, isName;
  final int maxLines;
  final TextAlign? textAlign;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      isName ? buildAbbreviateName(title) : title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall!.apply(
                fontWeightDelta: 2,
                color: textColor,
              ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }

  static String buildAbbreviateName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    if (nameParts.length < 2) {
      return fullName;
    }
    String firstName = nameParts[0];
    String lastName = nameParts.last;

    return '${firstName[0]}. $lastName';
  }
}
