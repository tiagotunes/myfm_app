import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final Color? color = THelperFunctions.getColor(text);
    final bool isCustomColor = text == 'customColor';
    // print(getColorHexFromStr('#4caf50'));
    // print(getColorHexFromStr('#2196f3'));
    // print(getColorHexFromStr('#f44336'));
    return ChoiceChip(
      label: color != null
          ? const SizedBox()
          : isCustomColor
              ? const Icon(
                  Icons.colorize_outlined,
                  color: TColors.darkGrey, // custom color selecionada
                )
              : Text(text),
      labelStyle: TextStyle(color: selected ? TColors.white : null),
      labelPadding:
          color != null || isCustomColor ? const EdgeInsets.all(0) : null,
      selected: selected,
      onSelected: onSelected,
      avatar: color != null
          ? TRoundedContainer(
              height: 50,
              width: 50,
              radius: 5,
              backgroundColor: color,
            )
          : null,
      showCheckmark: color != null,
      checkmarkColor: TColors.white,
      // (color != null && text == 'Black') ? TColors.white : color,
      padding: color != null || isCustomColor
          ? const EdgeInsets.all(TSizes.xs)
          : null,
      backgroundColor: color,
      selectedColor: color,
      side: color != null
          ? BorderSide(color: color, width: 2)
          : const BorderSide(color: TColors.darkerGrey),
    );
  }

  // static int getColorHexFromStr(String colorStr) {
  //   colorStr = "FF" + colorStr;
  //   colorStr = colorStr.replaceAll("#", "");
  //   int val = 0;
  //   int len = colorStr.length;
  //   for (int i = 0; i < len; i++) {
  //     int hexDigit = colorStr.codeUnitAt(i);
  //     if (hexDigit >= 48 && hexDigit <= 57) {
  //       val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
  //     } else if (hexDigit >= 65 && hexDigit <= 70) {
  //       // A..F
  //       val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
  //     } else if (hexDigit >= 97 && hexDigit <= 102) {
  //       // a..f
  //       val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
  //     } else {
  //       throw new FormatException("An error occurred when converting a color");
  //     }
  //   }
  //   return val;
  // }
}
