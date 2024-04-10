import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:myfm/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.wDiagonalRect = false,
    this.color = TColors.primary,
  });

  final Widget child;
  final bool wDiagonalRect;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.black,
        padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            /*wDiagonalRect
                ? TDiagonalRect(
                    height: TDeviceUtils.getAppBarHeight() * 2.5,
                    width: TSizes.defaultSpace * 3,
                    color: color,
                    first: false,
                  )
                : const SizedBox(),
            wDiagonalRect
                ? TDiagonalRect(
                    height: TDeviceUtils.getAppBarHeight() * 2.5,
                    width: TSizes.defaultSpace * 3,
                    color: color,
                    first: true,
                  )
                : const SizedBox(),*/
            child,
          ],
        ),
      ),
    );
  }
}
