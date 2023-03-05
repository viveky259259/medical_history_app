import 'package:flutter/material.dart';
import 'package:medical_history_app/features/dashboard/widgets/molecules/hospital_list_item_horizontal.dart';

class HostpitalListHorizontal extends StatelessWidget {
  final List<String> hospitalsNearBy = [
    "Aster Multispeciality hospital",
    "Government hospital",
    "Appolo 24x7 hospital",
  ];

  HostpitalListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return HostpitalListItemHorizontal(
            hospitalName: hospitalsNearBy[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16,
          );
        },
        itemCount: hospitalsNearBy.length);
  }
}
