import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';
import 'package:medical_history_app/features/dashboard/widgets/atom/concierge_item.dart';
import 'package:medical_history_app/features/dashboard/widgets/organisms/hospital_list_horizontal.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              "Hospitals near you",
              style: AppTextStyles.smallBigBold,
            ),
            const SizedBox(height: 16),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: HostpitalListHorizontal()),
            const SizedBox(height: 32),
            Text(
              "Your medical concierge",
              style: AppTextStyles.smallBigBold,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: ConciergeItem(),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      )),
    );
  }
}
