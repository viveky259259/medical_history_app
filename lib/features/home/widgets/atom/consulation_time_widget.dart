import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';

class ConsultationTimeWidget extends StatelessWidget {
  const ConsultationTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "5:35 PM",
            style: AppTextStyles.smallNormal,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Today",
            style: AppTextStyles.smallBold.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
