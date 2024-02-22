import 'package:flutter/material.dart';

class TDiagonalEdges extends CustomClipper<Path> {
  TDiagonalEdges({
    required this.diagonalFactor,
    required this.widthFactor,
    required this.first,
  });
  final int diagonalFactor;
  final int widthFactor;
  final bool first;

  @override
  Path getClip(Size size) {
    var path = Path();
    if (!first) {
      path.moveTo(
        size.width * (widthFactor - diagonalFactor) / widthFactor,
        0,
      );
    } // TL
    path.lineTo(0, size.height); // BL
    path.lineTo(size.width * diagonalFactor / widthFactor, size.height); // BR
    path.lineTo(size.width, 0); // TR
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
