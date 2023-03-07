import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical_history_app/common/constants.dart';
import 'package:medical_history_app/common/strings.dart';
import 'package:medical_history_app/common/text_styles.dart';
import 'package:medical_history_app/features/consultation/add_consultation/pages/add_consultation_page.dart';
import 'package:medical_history_app/features/home/widgets/atom/line_widget.dart';
import 'package:medical_history_app/features/home/widgets/atom/plus_button.dart';
import 'package:medical_history_app/features/home/widgets/organisms/consulation_dashboard_item_widget.dart';
import 'package:page_transition/page_transition.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(176, 184, 200, 0.4),
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
                const Expanded(flex: 1, child: SizedBox()),
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
                                    GestureDetector(
                                      onTap: () {
                                              Navigator.of(context).push(
                                                  PageTransition(
                                                      type:
                                                          PageTransitionType
                                                              .scale,
                                                      alignment: Alignment
                                                          .topRight,
                                                      isIos: true,
                                                      duration: const Duration(
                                                          milliseconds:
                                                              AppConstants
                                                                  .animtionTime),
                                                      child:
                                                      const AddConsultationPage()));
                                            },
                                      child: const Material(
                                        color: Colors.transparent,
                                        child: Hero(
                                            tag: Strings.consultationPageHeroTag,
                                            child: PlusButton(),
                                          ),
                                      ),
                                    ),
                                    StreamBuilder<double>(
                                      builder: (context,
                                          AsyncSnapshot<double> snapshot) {
                                        BoxConstraints? calculatedConstraints;

                                        try {
                                          calculatedConstraints = constraints.copyWith(
                                              minHeight: 0,
                                              maxHeight: _scrollController
                                                      .position
                                                      .maxScrollExtent +
                                                  (snapshot.data ?? 0),
                                              minWidth: 3,
                                              maxWidth: 3);
                                        } catch (e) {
                                          // TODO: act on exceptions
                                        }
                                        return ConstrainedBox(
                                            constraints: calculatedConstraints ?? constraints,
                                            child: const TimerLineWidget());
                                      },
                                      stream: streamController.stream,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              const Expanded(
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
                                      .copyWith(color: const Color(0xff0037ff)),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ConsultationDashboardItemWidget(
                                  isDeleteEnabled: true),
                              ConsultationDashboardItemWidget(),
                              ConsultationDashboardItemWidget(
                                  isDeleteEnabled: true),
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
