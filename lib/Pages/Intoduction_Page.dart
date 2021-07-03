import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Constant/shared_preference_constants.dart';
import 'package:zpapp/Pages/Dashboard_Page.dart';
import 'package:zpapp/Pages/LogIn_Page.dart';
import 'package:zpapp/Pages/LoginPage2.dart';

class IntoductionPage extends StatelessWidget {
  bool isIntroIn = false;
  bool isLoggedIn = false;
  final pages = [
    PageViewModel(
      pageColor: Color(0xff419B95),
      bubble: Image.asset('Images/student (1).png'),
      body: const Text(
        'You can acquire a lot of knowledge without ever going to school',
      ),
      title: const Text(
        'School',
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        'Images/school.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'Images/student (1).png',
      body: const Text(
        'Education is a social process. Education is growth. Education is, not a preparation for life; education is life itself',
      ),
      title: const Text('Student'),
      mainImage: Image.asset(
        'Images/student (3).png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.orange,
              Colors.pinkAccent,
            ],
          ),
        ),
      ),
      iconImageAssetPath: 'Images/student (1).png',
      body: const Text(
        'They are the ones to teach their students to differentiate between good and bad things in life',
      ),
      title: const Text('Teacher'),
      mainImage: Image.asset(
        'Images/classroom.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            print("_onIntroEnd Call:");
            SharedPreferencesConstants.instance.setBooleanValue(
                SharedPreferencesConstants.INTROSCREENCHECK, true);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
            );
          },
          onTapSkipButton: () {
            print("_onIntroEnd Call:");
            SharedPreferencesConstants.instance.setBooleanValue(
                SharedPreferencesConstants.INTROSCREENCHECK, true);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
            );
          },
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
