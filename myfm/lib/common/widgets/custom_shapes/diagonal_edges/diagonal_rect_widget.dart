import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/diagonal_edges/diagonal_edges.dart';

class TDiagonalRect extends StatelessWidget {
  const TDiagonalRect({
    super.key,
    required this.height,
    required this.width,
    required this.colors,
    required this.first,
  });

  final double height, width;
  final List<Color> colors;
  final bool first;
  static double diagonalFactor = 0.53;

  @override
  Widget build(BuildContext context) {
    double pos = first ? -2 : 2;
    return Positioned(
      // top: 50,
      // left: 100 + 15 * pos,
      left: (width * diagonalFactor).roundToDouble() / pos,
      child: ClipPath(
        clipper: TDiagonalEdges(
          diagonalFactor: diagonalFactor,
          first: first,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: colors,
            ),
          ),
          height: height,
          width: width,
        ),
      ),
    );
  }
}
