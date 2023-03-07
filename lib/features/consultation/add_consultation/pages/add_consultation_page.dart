import 'package:flutter/material.dart';
import 'package:medical_history_app/common/constants.dart';
import 'package:medical_history_app/common/strings.dart';
import 'package:medical_history_app/common/text_styles.dart';
import 'package:medical_history_app/features/consultation/add_consultation/widgets/molecules/consultation_service_type_widget.dart';
import 'package:medical_history_app/features/consultation/common/consulation_colors.dart';
import 'package:medical_history_app/features/home/widgets/atom/cta_button.dart';

class AddConsultationPage extends StatefulWidget {
  const AddConsultationPage({Key? key}) : super(key: key);

  @override
  State<AddConsultationPage> createState() => _AddConsultationPageState();
}

class _AddConsultationPageState extends State<AddConsultationPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  late Animation<int> layoutAnimation;
  int selectedIndex = -1;
  List<String> serviceTypes = [
    "Tele-Consultation",
    "Consultation",
    "Lab tests",
    "Diagnostics",
    "Health Checkup"
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: AppConstants.animtionTime));
    colorAnimation = ColorTween(
      begin: ConsultationColors.pageBgColor,
      end: Colors.white70,
    ).animate(controller);
    layoutAnimation = IntTween(begin: 16, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.forward();
      controller.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorAnimation.value,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).padding.top - layoutAnimation.value,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: Hero(
                    tag: Strings.consultationPageHeroTag,
                    child: Material(
                      color: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          )),
                    )),
                title: Text("Choose type of service",
                    style: AppTextStyles.normalBold),
              ),
            ),
            Positioned(
              left: layoutAnimation.value.toDouble(),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const  EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ConsultationServiceType(
                          serviceName: serviceTypes[index],
                          isSelected: index == selectedIndex,
                          onTap: () {
                            if (selectedIndex != index) {
                              selectedIndex = index;
                            } else {
                              selectedIndex = -1;
                            }
                            setState(() {});
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const  SizedBox(
                          height: 16,
                        );
                      },
                      itemCount: serviceTypes.length),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: AppConstants.animtionTime),
              height: selectedIndex > -1 ? 48 : 0,
              bottom:  selectedIndex > -1 ? MediaQuery.of(context).padding.bottom + 16 :-100,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: CtaButton(
                  text: "Continue",
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
