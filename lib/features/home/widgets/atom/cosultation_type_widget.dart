import 'package:flutter/material.dart';

class ConsultationType extends StatelessWidget {
  const ConsultationType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: 110,
            height: 12,
            color: Colors.yellow,
          ),
        ),
        Text("CONSULTATION"),
      ],
    );
  }
}
