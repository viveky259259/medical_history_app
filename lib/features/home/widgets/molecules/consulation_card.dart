import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';
import 'package:medical_history_app/features/dashboard/widgets/atom/consultation_prescription.dart';
import 'package:medical_history_app/features/home/widgets/atom/cosultation_item_bottom.dart';
import 'package:medical_history_app/features/home/widgets/atom/cta_button.dart';
import 'package:medical_history_app/features/home/widgets/molecules/cosultation_item_top.dart';

class ConsultationCard extends StatelessWidget {
  final bool isDeleteEnabled;

  const ConsultationCard({Key? key, this.isDeleteEnabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ConsultationTopItem(),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "DR. Jordan Henderson",
                  style: AppTextStyles.normalBold,
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Aster RV - Multispeciality Hospital, JP Nagar, Bengaluru",
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                SizedBox(
                  height: 8,
                ),
                ConsultationPrescription(),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    CtaButton(text: "UPLOAD DOCS", onPressed: () {}),
                    SizedBox(
                      width: 16,
                    ),
                    if (isDeleteEnabled)
                      CtaButton(
                          text: "Delete",
                          bgColor: Color(0xffFDD6D4),
                          textColor: Color(0xffFC4D53),
                          onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
          ConsultationItemBottom()
        ],
      ),
    );
  }
}
