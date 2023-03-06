import 'package:flutter/material.dart';
import 'package:medical_history_app/common/constants.dart';
import 'package:medical_history_app/features/dashboard/pages/dashboard_page.dart';

import 'package:medical_history_app/features/history/pages/history_page.dart';
import 'package:medical_history_app/features/home/common/home_colors.dart';
import 'package:medical_history_app/features/home/pages/temp_page.dart';
import 'package:medical_history_app/features/home/widgets/molecules/end_item_bottom_navigation_clipper.dart';
import 'package:medical_history_app/features/home/widgets/molecules/inital_item_bottom_navigation_clipper.dart';
import 'package:medical_history_app/features/home/widgets/molecules/middle_item_bottom_navigation_clipper.dart';
import 'package:medical_history_app/features/home/widgets/molecules/unselected_item_bottom_navigation_clipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> _pages;
  late List<String> _bottomNavigationIcons;
  late PageController _pageController;
  int _currentPageIndex = 0;
  static const double bottomNavHeight = 56;

  @override
  void initState() {
    super.initState();
    _pages = const [
      DashboardPage(),
      HistoryPage(),
      TempPage(name: "Wellness"),
      TempPage(name: "Profile")
    ];

    _bottomNavigationIcons = [
      "assets/home_icon.png",
      "assets/history-icon.png",
      "assets/wellness.png",
      "assets/user.png",
    ];

    _pageController =
        PageController(initialPage: _currentPageIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          _currentPageIndex = index;
          setState(() {});
        },
        itemBuilder: (context, index) {
          if (index > _pages.length) {
            return Scaffold();
          }
          return _pages[index];
        },
        itemCount: 4,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) {
                String icon = _bottomNavigationIcons[index];
                CustomClipper<Path> clipper;

                switch (index) {
                  case 0:
                    clipper = InitialItemCustomShape();
                    break;

                  case 1:
                  case 2:
                    clipper = MiddleItemCustomShape();
                    break;

                  case 3:
                    clipper = EndItemCustomShape();
                    break;
                  default:
                    clipper = MiddleItemCustomShape();
                }

                Widget selectedChild = InkWell(
                  onTap: () {
                    _currentPageIndex = index;
                    _pageController.animateToPage(index,
                        duration:
                            Duration(milliseconds: AppConstants.animtionTime),
                        curve: Curves.easeIn);
                    setState(() {});
                  },
                  child: ClipPath(
                    clipper: _currentPageIndex == index
                        ? clipper
                        : UnSelectedItemCustomShape(),
                    child: Container(
                      height: bottomNavHeight,
                      color: _currentPageIndex == index
                          ? Colors.black
                          : Colors.transparent,
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                icon,
                                color: _currentPageIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              ".",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
                Widget unselectedChild = InkWell(
                  onTap: () {
                    _currentPageIndex = index;
                    _pageController.animateToPage(index,
                        duration:
                            Duration(milliseconds: AppConstants.animtionTime),
                        curve: Curves.easeIn);
                    setState(() {});
                  },
                  child: Container(
                    height: bottomNavHeight,
                    color: _currentPageIndex == index
                        ? Colors.black
                        : Colors.transparent,
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              icon,
                              color: _currentPageIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            ".",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                );
                return Expanded(
                    child: _currentPageIndex == index
                        ? selectedChild
                        : unselectedChild);

                // return Expanded(
                //   child: AnimatedCrossFade(
                //       firstChild: selectedChild,
                //       secondChild: unselectedChild,
                //       crossFadeState: _currentPageIndex == index
                //           ? CrossFadeState.showFirst
                //           : CrossFadeState.showSecond,
                //       duration:
                //           Duration(milliseconds: AppConstants.animtionTime)),
                // );

                return _currentPageIndex == index
                    ? selectedChild
                    : unselectedChild;
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).padding.bottom,
            color: Colors.black,
          )
        ],
      ),
    );

    // BottomNavigationBar(
    //   backgroundColor: HomeColors.bgColor,
    //   currentIndex: _currentPageIndex,
    //   selectedItemColor: Colors.black,
    //   unselectedItemColor: Colors.blue,
    //   onTap: (selectedIndex) {
    //     _pageController.animateToPage(selectedIndex,
    //         duration: Duration(microseconds: AppConstants.animtionTime),
    //         curve: Curves.easeIn);
    //   },
    //   items: [
    //     BottomNavigationBarItem(
    //       label: ".",
    //       icon: ClipPath(
    //         clipper: InitialItemCustomShape(),
    //         child: CircleAvatar(
    //             backgroundColor: _currentPageIndex == 0
    //                 ? Colors.black
    //                 : Colors.transparent,
    //             child: Image.asset(
    //               "assets/home_icon.png",
    //               height: 24,
    //               width: 24,
    //               color: _currentPageIndex == 0 ? Colors.white : Colors.black,
    //             )),
    //       ),
    //     ),
    //     BottomNavigationBarItem(
    //       label: ".",
    //       icon: CircleAvatar(
    //           backgroundColor:
    //               _currentPageIndex == 1 ? Colors.black : Colors.transparent,
    //           child: Icon(
    //             Icons.av_timer,
    //             color: _currentPageIndex == 1 ? Colors.white : Colors.black,
    //           )),
    //     ),
    //     BottomNavigationBarItem(
    //       label: ".",
    //       icon: CircleAvatar(
    //           backgroundColor:
    //               _currentPageIndex == 2 ? Colors.black : Colors.transparent,
    //           child: Image.asset(
    //             "assets/wellness.png",
    //             height: 24,
    //             width: 24,
    //             color: _currentPageIndex == 2 ? Colors.white : Colors.black,
    //           )),
    //     ),
    //     BottomNavigationBarItem(
    //       label: ".",
    //       icon: CircleAvatar(
    //           backgroundColor:
    //               _currentPageIndex == 3 ? Colors.black : Colors.transparent,
    //           child: Image.asset(
    //             "assets/user.png",
    //             height: 24,
    //             width: 24,
    //             color: _currentPageIndex == 3 ? Colors.white : Colors.black,
    //           )),
    //     )
    //   ],
    // ),
  }
}
