import 'package:flutter/material.dart';
import 'package:medical_history_app/features/home/widgets/atom/consulation_time_widget.dart';
import 'package:medical_history_app/features/home/widgets/molecules/consulation_card.dart';

class ConsultationDashboardItemWidget extends StatelessWidget {
  final bool isDeleteEnabled;

  const ConsultationDashboardItemWidget(
      {Key? key, this.isDeleteEnabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConsultationTimeWidget(),
        Expanded(
            child: ConsultationCard(
          isDeleteEnabled: isDeleteEnabled,
        ))
      ],
    );
  }
}
