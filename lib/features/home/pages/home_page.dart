import 'package:flutter/material.dart';
import 'package:medical_history_app/common/constants.dart';
import 'package:medical_history_app/features/dashboard/pages/dashboard_page.dart';

import 'package:medical_history_app/features/history/pages/history_page.dart';
import 'package:medical_history_app/features/home/common/home_colors.dart';
import 'package:medical_history_app/features/home/pages/temp_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> _pages;
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = const [
      DashboardPage(),
      HistoryPage(),
      TempPage(name: "Wellness"),
      TempPage(name: "Profile")
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HomeColors.bgColor,
        currentIndex: _currentPageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue,
        onTap: (selectedIndex) {
          _pageController.animateToPage(selectedIndex,
              duration: Duration(microseconds: AppConstants.animtionTime),
              curve: Curves.easeIn);
        },
        items: [
          BottomNavigationBarItem(
            label: ".",
            icon: CircleAvatar(
                backgroundColor:
                    _currentPageIndex == 0 ? Colors.black : Colors.transparent,
                child: Image.asset(
                  "assets/home_icon.png",
                  height: 24,
                  width: 24,
                  color: _currentPageIndex == 0 ? Colors.white : Colors.black,
                )),
          ),
          BottomNavigationBarItem(
            label: ".",
            icon: CircleAvatar(
                backgroundColor:
                    _currentPageIndex == 1 ? Colors.black : Colors.transparent,
                child: Icon(
                  Icons.av_timer,
                  color: _currentPageIndex == 1 ? Colors.white : Colors.black,
                )),
          ),
          BottomNavigationBarItem(
            label: ".",
            icon: CircleAvatar(
                backgroundColor:
                    _currentPageIndex == 2 ? Colors.black : Colors.transparent,
                child:  Image.asset(
                  "assets/wellness.png",
                  height: 24,
                  width: 24,
                  color: _currentPageIndex == 2 ? Colors.white : Colors.black,
                )),
          ),
          BottomNavigationBarItem(
            label: ".",
            icon: CircleAvatar(
                backgroundColor:
                    _currentPageIndex == 3 ? Colors.black : Colors.transparent,
                child:   Image.asset(
                  "assets/user.png",
                  height: 24,
                  width: 24,
                  color: _currentPageIndex == 3 ? Colors.white : Colors.black,
                )),
          )
        ],
      ),
    );
  }
}
