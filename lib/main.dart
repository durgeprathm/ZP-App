import 'package:flutter/material.dart';
import 'package:zpapp/Pages/Dashboard_Page.dart';
import 'package:zpapp/Pages/Intoduction_Page.dart';
import 'package:zpapp/Pages/splash_Screen_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
