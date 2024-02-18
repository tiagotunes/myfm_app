import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:myfm/common/widgets/custom_shapes/diagonal_edges/diagonal_rect_widget.dart';
import 'package:myfm/utils/constants/colors.dart';

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
        child: const SizedBox(
          width: double.infinity,
          height: 400,
          child: Stack(
            children: [
              Positioned(left: 10, child: TDiagonalRect(color: Colors.red)),
              Positioned(left: -30, child: TDiagonalRect(color: Colors.orange)),
            ],
          ),
        ),
      ),
    );
  }
}
