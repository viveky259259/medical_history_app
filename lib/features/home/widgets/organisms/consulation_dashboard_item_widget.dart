import 'package:flutter/material.dart';
import 'package:medical_history_app/features/home/widgets/atom/consulation_time_widget.dart';
import 'package:medical_history_app/features/home/widgets/molecules/consulation_card.dart';
import 'package:medical_history_app/features/home/widgets/organisms/consultation_edit_feedback.dart';

class ConsultationDashboardItemWidget extends StatelessWidget {
  final bool isDeleteEnabled;

  late Widget currentChild;
  late TextEditingController controller;

  ConsultationDashboardItemWidget({Key? key, this.isDeleteEnabled = false})
      : super(key: key) {
    controller = TextEditingController(
        text: "Every interaction with the hospital is great");
  }

  void onEditFeedbackClicked(BuildContext context) {
    RenderBox? renderObject = context.findRenderObject() as RenderBox?;
    if (renderObject != null) {
      var size = renderObject.size;
      var offset = renderObject.localToGlobal(Offset.zero);

      Widget widget = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ConsultationTimeWidget(),
          Expanded(
              child: ConsultationCard(
            feedbackController: controller,
            isEditFeedbackEnabled: true,
            isDeleteEnabled: isDeleteEnabled,
            onEditFeedbackTap: () {
              onEditFeedbackClicked(context);
            },
          ))
        ],
      );
      late OverlayEntry overlayEntry;
      overlayEntry = OverlayEntry(builder: (context) {
        return ConsultationEditFeedback(
          feedbackController: controller,
          size: size,
          offset: offset,
          onDismiss: () {
            removeOverlay(overlayEntry);
          },
          child: widget,
        );
      });
      Overlay.of(context).insertAll([overlayEntry]);
    }
  }

  void removeOverlay(OverlayEntry overlayEntry) {
    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ConsultationTimeWidget(),
        Expanded(
            child: ConsultationCard(
          isDeleteEnabled: isDeleteEnabled,
          onEditFeedbackTap: () {
            onEditFeedbackClicked(context);
          },
        ))
      ],
    );
  }
}
