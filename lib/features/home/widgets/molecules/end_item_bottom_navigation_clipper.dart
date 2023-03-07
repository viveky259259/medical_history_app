import 'package:flutter/material.dart';

class EndItemCustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width * 0.6, 0);
    path.quadraticBezierTo(
        size.width * 0.4, 0, size.width * 0.3, size.height / 2);
    path.quadraticBezierTo(size.width * 0.2, size.height, 0, size.height);

    path.lineTo(size.width, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
