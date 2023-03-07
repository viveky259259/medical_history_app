import 'package:flutter/material.dart';
import 'package:medical_history_app/features/prescription/pages/prescription_page.dart';

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
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                var result = await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PrescriptionPage(
                          image: "assets/prescription.jpeg",
                        )));
                if (result is String && result.toString().isNotEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(result.toString())));
                }
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: AssetImage("assets/prescription.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
          itemCount: 3),
    );
  }
}
