import 'package:flutter/material.dart';

class TempPage extends StatelessWidget {
  final String name;

  const TempPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(name),
      ),
    );
  }
}
