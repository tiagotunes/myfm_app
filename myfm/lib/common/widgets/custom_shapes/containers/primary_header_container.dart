import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:myfm/common/widgets/custom_shapes/diagonal_edges/diagonal_rect_widget.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/device/device_utility.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.black,
        padding: const EdgeInsets.only(bottom: 0),
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: Stack(
            children: [
              TDiagonalRect(
                height: TDeviceUtils.getAppBarHeight() * 3,
                width: TSizes.defaultSpace * 3,
                colors: [
                  TColors.beginGradient.withOpacity(0.5),
                  TColors.endGradient.withOpacity(0.3),
                  Colors.transparent,
                ],
                first: false,
              ),
              TDiagonalRect(
                height: TDeviceUtils.getAppBarHeight() * 3,
                width: TSizes.defaultSpace * 3,
                colors: [
                  TColors.beginGradient.withOpacity(0.7),
                  TColors.endGradient.withOpacity(0.5),
                  Colors.transparent,
                ],
                first: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
