import 'package:flutter/material.dart';
import 'package:medical_history_app/common/strings.dart';

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
        const Text(Strings.consultationText),
      ],
    );
  }
}
