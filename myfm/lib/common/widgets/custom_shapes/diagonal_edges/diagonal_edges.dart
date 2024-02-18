import 'package:flutter/material.dart';

class TDiagonalEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 35 / 75, 0); // TL
    path.lineTo(0, size.height); // BL
    path.lineTo(size.width * 40 / 75, size.height); // BR
    path.lineTo(size.width, 0); // TR
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
