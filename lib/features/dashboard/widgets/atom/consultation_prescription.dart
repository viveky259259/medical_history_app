import 'package:flutter/material.dart';

class ConsultationPrescription extends StatelessWidget {
  const ConsultationPrescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
          primary: true,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage("assets/prescription.jpeg"),
                  fit: BoxFit.cover
                  ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 16,
              ),
          itemCount: 3),
    );
  }
}
