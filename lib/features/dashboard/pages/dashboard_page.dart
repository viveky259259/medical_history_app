import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medical_history_app/common/text_styles.dart';
import 'package:medical_history_app/features/home/widgets/atom/line_widget.dart';
import 'package:medical_history_app/features/home/widgets/atom/plus_button.dart';
import 'package:medical_history_app/features/home/widgets/organisms/consulation_dashboard_item_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Size _screenSize;
  late ScrollController _scrollController;
  StreamController<double> streamController = StreamController<double>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        streamController.add(_scrollController.offset);
      });
      streamController.add(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    print(_screenSize);
    return Scaffold(
      backgroundColor: Color.fromRGBO(176, 184, 200, 0.4),
      body: SafeArea(child: LayoutBuilder(builder: (context, cns) {
        return ListView(
          controller: _scrollController,
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            Center(
                child: Text(
              "My History",
              style: AppTextStyles.mediumTitle,
            )),
            Row(
              children: [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                    flex: 19,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(child: PlusButton()),
                                    StreamBuilder<double>(
                                      builder: (context,
                                          AsyncSnapshot<double> snapshot) {
                                        BoxConstraints? _cns;

                                        try {
                                          _cns = constraints.copyWith(
                                              minHeight: 0,
                                              maxHeight: _scrollController
                                                      .position
                                                      .maxScrollExtent +
                                                  (snapshot.data ?? 0),
                                              minWidth: 3,
                                              maxWidth: 3);
                                          print("eee ${_cns}");
                                        } catch (e) {}
                                        print(_cns);
                                        return ConstrainedBox(
                                            constraints: _cns ?? constraints,
                                            child: TimerLineWidget());
                                      },
                                      stream: streamController.stream,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                flex: 15,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 84, top: 20, bottom: 20),
                                child: Text(
                                  "Add Consultation",
                                  style: AppTextStyles.normalBold
                                      .copyWith(color: Color(0xff0037ff)),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              ConsultationDashboardItemWidget(),
                              ConsultationDashboardItemWidget(),
                              ConsultationDashboardItemWidget(),
                              ConsultationDashboardItemWidget(),
                              ConsultationDashboardItemWidget(),
                              ConsultationDashboardItemWidget(),
                              ConsultationDashboardItemWidget(),
                              ConsultationDashboardItemWidget(),
                            ],
                          ),
                        ],
                      );
                    }))
              ],
            ),
          ],
        );
      })),
    );
  }
}
