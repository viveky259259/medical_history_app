import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';
import 'package:medical_history_app/features/home/widgets/atom/consulation_time_widget.dart';
import 'package:medical_history_app/features/home/widgets/atom/cta_button.dart';
import 'package:medical_history_app/features/home/widgets/atom/dismiss_button.dart';

class ConsultationEditFeedback extends StatefulWidget {
  final Function() onDismiss;
  final Offset offset;
  final Size size;
  final TextEditingController feedbackController;
  final Widget child;

  ConsultationEditFeedback(
      {Key? key,
      required this.child,
      required this.onDismiss,
      required this.offset,
      required this.size,
      required this.feedbackController})
      : super(key: key);

  @override
  State<ConsultationEditFeedback> createState() =>
      _ConsultationEditFeedbackState();
}

class _ConsultationEditFeedbackState extends State<ConsultationEditFeedback>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<int> animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 374));
    animation = IntTween(begin: 100, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.addListener(() {
      print(animationController.value);
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade300,
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              top: MediaQuery.of(context).padding.top - animation.value,
              child: Container(
                alignment: Alignment.topCenter,
                child: DismissButton(
                  onPressed: ()  {
                    animationController.reverse();
                    animationController.addStatusListener((status)  {
                      widget.onDismiss();
                    });
                  },
                  bgColor: Colors.grey.shade50,
                  textColor: Colors.black,
                ),
              ),
            ),
            Positioned(
                left: widget.offset.dx,
                right: 0,
                top: widget.offset.dy - animation.value,
                child: widget.child),
            Positioned(
                left: widget.offset.dx + 16,
                top: widget.offset.dy +
                    widget.size.height +
                    32 -
                    animation.value,
                child: Row(
                  children: [
                    Opacity(
                      child: ConsultationTimeWidget(),
                      opacity: 0,
                    ),
                    ValueListenableBuilder(
                      valueListenable: widget.feedbackController,
                      builder: (context, value, _) {
                        print("changed");
                        return Chip(
                          backgroundColor: Colors.grey.shade500,
                          label: Text(
                            '${widget.feedbackController.text.length}/140',
                            style: AppTextStyles.smallNormal
                                .copyWith(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ],
                )),
            Positioned(
                left: 16,
                right: 16,
                bottom: 0.0 - animation.value,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CtaButton(
                    height: 40,
                    text: "Update Feedback",
                    onPressed: () {},
                    textColor: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
