import 'dart:math';

import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: min(64, constraints.maxWidth),
        width: min(64, constraints.maxWidth),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  color: Color(0x2f0037ff),
                  borderRadius: BorderRadius.all(Radius.circular(200))),
            ),
            Container(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.all(8),
              decoration:const  BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0037ff),
              ),
              alignment: Alignment.center,
              child: const Text(
                "+",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      );
    });
  }
}
