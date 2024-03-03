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
    this.wDiagonalRect = false,
    this.colors,
  });

  final Widget child;
  final bool wDiagonalRect;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.black,
        padding: const EdgeInsets.only(bottom: 0),
        child: SizedBox(
          width: double.infinity,
          // height: 400,
          child: Stack(
            children: [
              wDiagonalRect
                  ? TDiagonalRect(
                      height: TDeviceUtils.getAppBarHeight() * 2.5,
                      width: TSizes.defaultSpace * 3,
                      colors: [
                        colors![0].withOpacity(0.5),
                        colors![1].withOpacity(0.3),
                        Colors.transparent,
                      ],
                      first: false,
                    )
                  : const SizedBox(),
              wDiagonalRect
                  ? TDiagonalRect(
                      height: TDeviceUtils.getAppBarHeight() * 2.5,
                      width: TSizes.defaultSpace * 3,
                      colors: [
                        colors![0].withOpacity(0.7),
                        colors![1].withOpacity(0.5),
                        Colors.transparent,
                      ],
                      first: true,
                    )
                  : const SizedBox(),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
