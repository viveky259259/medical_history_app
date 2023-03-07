import 'package:flutter/material.dart';
import 'package:medical_history_app/common/constants.dart';
import 'package:medical_history_app/features/dashboard/pages/dashboard_page.dart';
import 'package:medical_history_app/features/history/pages/history_page.dart';
import 'package:medical_history_app/features/home/pages/temp_page.dart';
import 'package:medical_history_app/features/home/widgets/organisms/bottom_navigation_bar.dart';

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
        itemCount: _pages.length,
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentPageIndex,
        onChange: (int selectedIndex) {
          _currentPageIndex = selectedIndex;
          _pageController.animateToPage(selectedIndex,
              duration: Duration(milliseconds: AppConstants.animtionTime),
              curve: Curves.easeIn);
          setState(() {});
        },
      ),
    );
  }
}
