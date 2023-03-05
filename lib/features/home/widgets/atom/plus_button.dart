import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxWidth,
        width: constraints.maxWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Color(0x6f0037ff),
                  borderRadius: BorderRadius.all(Radius.circular(200))),
            ),
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0037ff),
              ),
              child: Center(
                  child: Text(
                "+",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ],
        ),
      );
    });
  }
}
