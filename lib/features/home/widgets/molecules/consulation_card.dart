import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';

import 'package:medical_history_app/features/history/widgets/atom/consultation_prescription.dart';
import 'package:medical_history_app/features/home/widgets/atom/cosultation_item_bottom.dart';
import 'package:medical_history_app/features/home/widgets/atom/cta_button.dart';
import 'package:medical_history_app/features/home/widgets/molecules/cosultation_item_top.dart';

class ConsultationCard extends StatelessWidget {
  final bool isDeleteEnabled;
  final Function() onEditFeedbackTap;
  final bool isEditFeedbackEnabled;
  final TextEditingController? feedbackController;

  const ConsultationCard(
      {Key? key,
      required this.onEditFeedbackTap,
      this.isDeleteEnabled = false,
      this.isEditFeedbackEnabled = false,
      this.feedbackController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8),
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const ConsultationTopItem(),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "DR. Jordan Henderson",
                  style: AppTextStyles.normalBold,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text("Aster RV - Multispeciality Hospital, JP Nagar, Bengaluru",
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(
                  height: 16,
                ),
                const ConsultationPrescription(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    CtaButton(text: "UPLOAD DOCS", onPressed: () {}),
                    const SizedBox(
                      width: 16,
                    ),
                    if (isDeleteEnabled)
                      CtaButton(
                          text: "DELETE",
                          bgColor: const Color(0xffFDD6D4),
                          textColor: const Color(0xffFC4D53),
                          onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
          ConsultationItemBottom(
            onEditFeedbackTap: onEditFeedbackTap,
            isEditFeedbackEnabled: isEditFeedbackEnabled,
            feedbackController: feedbackController,
          )
        ],
      ),
    );
  }
}
