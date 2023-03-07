import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';

class ConciergeItem extends StatelessWidget {
  const ConciergeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: const  BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/face.png"), fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: RichText(
                text: TextSpan(
                    text: "Vivek",
                    style:
                        AppTextStyles.normalBold.copyWith(color: Colors.black),
                    children: [
                      const TextSpan(text: " "),
              TextSpan(
                text: "Yadav",
                style: AppTextStyles.normal.copyWith(color: Colors.black),
              )
            ]))),
        Container(
            height: 32,
            width: 32,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/whatsapp_logo.png"),
                    fit: BoxFit.cover))),
        const SizedBox(
          width: 16,
        ),
        Container(
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/call_icon.png"),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
