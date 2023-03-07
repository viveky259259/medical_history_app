import 'package:flutter/material.dart';

class UnSelectedItemCustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width ,0);
    path.lineTo(size.width ,size.height);
    path.lineTo(0 ,size.height);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
