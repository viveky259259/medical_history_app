import 'package:flutter/material.dart';
import 'package:medical_history_app/common/strings.dart';
import 'package:medical_history_app/features/home/common/home_colors.dart';

class DismissButton extends StatelessWidget {
  final Function() onPressed;
  final Color bgColor;
  final Color? textColor;
  final double? height;

  const DismissButton(
      {Key? key,
      required this.onPressed,
      this.bgColor = HomeColors.ctaBgColor,
      this.height,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(48))),
            backgroundColor: bgColor,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.close,
                color: Colors.black,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
               Strings.dismissButtonText,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ],
          )),
    );
  }
}
