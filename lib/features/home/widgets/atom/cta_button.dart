import 'package:flutter/material.dart';
import 'package:medical_history_app/features/home/common/home_colors.dart';

class CtaButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color bgColor;
  final Color? textColor;
  final double? height;

  const CtaButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.bgColor = HomeColors.ctaBgColor,
      this.height,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 32,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(48))),
            backgroundColor: bgColor,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          )),
    );
  }
}
