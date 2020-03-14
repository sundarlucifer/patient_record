import 'package:flutter/material.dart';
import 'package:patient_record/screens/record_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient Record',
      theme: ThemeData(
        primaryColor: Color(0xff00A3FF),
      ),
      home: RecordScreen(),
    );
  }
}
