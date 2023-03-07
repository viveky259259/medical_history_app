import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';

class HostpitalListItemHorizontal extends StatelessWidget {
  final String hospitalName;

  const HostpitalListItemHorizontal({Key? key, required this.hospitalName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Image.asset(
            "assets/hospital_photo.png",
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 16,
              left: 16,
              child: Image.asset(
                "assets/aster_logo.png",
                height: 24,
                width: 64,
              )),
          Positioned(
              bottom: 32,
              left: 16,
              right: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospitalName,
                    style:
                        AppTextStyles.normalBold.copyWith(color: Colors.white),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hebbal, Banglore",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: const Color(0xffFBE277),
                            borderRadius: BorderRadius.circular(4)),
                        child:const  Text("1.9 km"),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
