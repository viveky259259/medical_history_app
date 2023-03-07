import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';

class ConsultationServiceType extends StatelessWidget {
  final bool isSelected;
  final String serviceName;
  final Function() onTap;

  const ConsultationServiceType(
      {Key? key,
      required this.serviceName,
      required this.onTap,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: isSelected
          ? Container(
              width: 8,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0055FF),
              ))
          : null,
      title: Text(
        serviceName,
        style: isSelected
            ? AppTextStyles.smallBigBold
            : AppTextStyles.smallBigNormal,
      ),
      trailing: isSelected
          ? const Icon(
              Icons.check_circle,
              color: Colors.black,
              size: 32,
            )
          : null,
    );
  }
}
