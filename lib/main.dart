import 'package:flutter/material.dart';
import 'package:mobile_application_final_project/questions.dart';
import 'package:mobile_application_final_project/error.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Project',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(
        title: 'Mobile Project',
      ),
    );
  }
}
