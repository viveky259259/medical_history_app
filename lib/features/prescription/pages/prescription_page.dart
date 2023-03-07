import 'package:flutter/material.dart';
import 'package:medical_history_app/common/strings.dart';
import 'package:medical_history_app/features/home/widgets/atom/cta_button.dart';
import 'package:medical_history_app/features/prescription/common/prescription_color.dart';

class PrescriptionPage extends StatelessWidget {
  final String image;

  const PrescriptionPage({Key? key, required this.image}) : super(key: key);

  void openDeleteBottom(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        useSafeArea: true,
        builder: (_) => Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).size.height * 0.1),
              child: CtaButton(
                  text:Strings.prescriptionDeleteButtonText,
                  height: 40,
                  bgColor: PrescriptionColor.deleteButtonBgColor,
                  textColor: PrescriptionColor.deleteTextColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop("File Deleted");
                  }),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  right: 16,
                  child: IconButton(
                    icon:const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )),
              Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () => openDeleteBottom(context),
          child: Container(
            height: 56 + MediaQuery.of(context).padding.bottom,
            width: double.infinity,
            color: Colors.grey,
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.topRight,
              child: const Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ));
  }
}
