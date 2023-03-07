import 'package:flutter/material.dart';

class InitialItemCustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double width = size.width;
    double height = size.height;
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(width * 0.4, 0);
    path.quadraticBezierTo(width * 0.6, 0, width * 0.7, height / 2);
    path.quadraticBezierTo(width * 0.8, height, width, height);
    path.lineTo(0, height);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
