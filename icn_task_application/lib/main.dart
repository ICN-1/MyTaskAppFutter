import 'package:flutter/material.dart';
import 'package:icn_task_application/other_pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple[700]
      ),
      home: Intro_Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
