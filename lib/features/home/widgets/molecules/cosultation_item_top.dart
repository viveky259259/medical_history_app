import 'package:flutter/material.dart';
import 'package:medical_history_app/features/home/widgets/atom/cosultation_type_widget.dart';

class ConsultationTopItem extends StatelessWidget {
  const ConsultationTopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConsultationType(),

        Image.asset("assets/aster_logo.png",height: 16,width: 48,),
      ],
    );
  }
}
