import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/diagonal_edges/diagonal_edges.dart';

class TDiagonalRect extends StatelessWidget {
  const TDiagonalRect({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.first,
    this.diagonalFactor = 0.53,
  });

  final double height, width;
  final Color color;
  final bool first;
  final double diagonalFactor;

  @override
  Widget build(BuildContext context) {
    double pos = first ? -2 : 2;
    List<Color> colors = first 
      ? [color.withOpacity(0.7), color.withOpacity(0.4), color.withOpacity(0.01)] 
      : [color.withOpacity(0.4), color.withOpacity(0.2), color.withOpacity(0.01)];
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
              stops: const [0, 0.4, 0.6]
            ),
          ),
          height: height,
          width: width,
        ),
      ),
    );
  }
}
