import 'package:flutter/material.dart';

class TDiagonalEdges extends CustomClipper<Path> {
  TDiagonalEdges({
    required this.diagonalFactor,
    required this.first,
  });
  final double diagonalFactor;
  final bool first;

  @override
  Path getClip(Size size) {
    double dF = (size.width * diagonalFactor).roundToDouble();
    var path = Path();
    if (!first) {
      path.moveTo(size.width - dF, 0); // TL
    }
    path.lineTo(0, size.height); // BL
    path.lineTo(dF, size.height); // BR
    path.lineTo(size.width, 0); // TR
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
