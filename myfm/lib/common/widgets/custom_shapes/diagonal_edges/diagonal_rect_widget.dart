import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/custom_shapes/diagonal_edges/diagonal_edges.dart';

class TDiagonalRect extends StatelessWidget {
  const TDiagonalRect({
    super.key,
    this.height = 150,
    this.width = 75,
    required this.color,
  });

  final double? height, width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TDiagonalEdges(),
      child: Container(
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}
