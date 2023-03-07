import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';

class ConsultationItemBottom extends StatelessWidget {
  final Function() onEditFeedbackTap;
  final bool isEditFeedbackEnabled;
  late TextEditingController? feedbackController;

  ConsultationItemBottom(
      {Key? key,
      required this.onEditFeedbackTap,
      this.isEditFeedbackEnabled = false,
      this.feedbackController})
      : super(key: key) {
    if (feedbackController == null) {
      feedbackController = TextEditingController(
          text: "Every interaction with the hospital is great");
    } else {
      feedbackController?.text = "Every interaction with the hospital is great";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const  EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Color(0x1aC4C4C4),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Feedback",
                style: AppTextStyles.smallBigBold,
              ),
              InkWell(
                onTap: onEditFeedbackTap,
                child: Text(
                  "Edit",
                  style: AppTextStyles.smallBigBold,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          (isEditFeedbackEnabled)
              ? Builder(builder: (_) {
                  return TextField(
                    controller: feedbackController,
                    maxLines: 2,
                    autofocus: true,
                  );
                })
              : Text(feedbackController?.text ?? ' ')
        ],
      ),
    );
  }
}
