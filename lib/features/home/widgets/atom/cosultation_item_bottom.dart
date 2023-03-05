import 'package:flutter/material.dart';

class ConsultationItemBottom extends StatelessWidget {
  const ConsultationItemBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0x1aC4C4C4),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text("Feedback"), Spacer(), Text("Edit")],
          ),
          Text("Every intercation with the hospital is great")
        ],
      ),
    );
  }
}
