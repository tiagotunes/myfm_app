import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = TColors.borderPrimary,
    this.backgroundColor = TColors.white,
    this.padding,
    this.margin,
    this.radiusLeft = true,
    this.radiusRight = true,
  });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder, radiusLeft, radiusRight;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radiusLeft && radiusRight
            ? BorderRadius.circular(radius)
            : radiusLeft
                ? BorderRadius.horizontal(left: Radius.circular(radius))
                : radiusRight
                    ? BorderRadius.horizontal(right: Radius.circular(radius))
                    : const BorderRadius.all(Radius.zero),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
