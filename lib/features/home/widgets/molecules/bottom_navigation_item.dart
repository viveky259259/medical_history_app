import 'package:flutter/material.dart';
import 'package:medical_history_app/common/constants.dart';
import 'package:medical_history_app/features/home/widgets/molecules/unselected_item_bottom_navigation_clipper.dart';
import 'package:medical_history_app/features/home/widgets/organisms/bottom_navigation_bar.dart';

class AppBottomNavigationItem extends StatefulWidget {
  final Function() onTap;
  final bool isSelected;
  final String icon;
  final CustomClipper<Path> clipper;

  const AppBottomNavigationItem({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.icon,
    required this.clipper,
  }) : super(key: key);

  @override
  State<AppBottomNavigationItem> createState() =>
      _AppBottomNavigationItemState();
}

class _AppBottomNavigationItemState extends State<AppBottomNavigationItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: ClipPath(
        clipper:
            widget.isSelected ? widget.clipper : UnSelectedItemCustomShape(),
        child: Container(
          height: BOTTOM_NAV_HEIGHT,
          color: widget.isSelected ? Colors.black : Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      widget.icon,
                      color: widget.isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
