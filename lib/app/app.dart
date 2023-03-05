import 'package:flutter/material.dart';
import 'package:medical_history_app/features/home/pages/home_page.dart';

class MedicalHistoryApp extends StatelessWidget {
  const MedicalHistoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Medical History App",
      home: HomePage(),
    );
  }
}