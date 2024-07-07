import 'package:flutter/material.dart';
/* import 'package:mobile_application_final_project/questions.dart';
import 'package:mobile_application_final_project/error.dart'; */

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizle',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.pink,
            side: const BorderSide(color: Colors.pink),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
        ),
      ),
      home: MyHomePage(title: 'Quizle'),
    );
  }
}
