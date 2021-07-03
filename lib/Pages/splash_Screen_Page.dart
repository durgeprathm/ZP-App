import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Constant/shared_preference_constants.dart';
import 'package:zpapp/Constant/size_config.dart';
import 'package:zpapp/Pages/Dashboard_Page.dart';
import 'package:zpapp/Pages/Intoduction_Page.dart';
import 'package:zpapp/Pages/LogIn_Page.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isIntroIn = false;
  bool isLoggedIn = false;
  _SplashScreenState() {
    SharedPreferencesConstants.instance
        .getBooleanValue(SharedPreferencesConstants.INTROSCREENCHECK)
        .then((value) => setState(() {
              isIntroIn = value;
            }));
    print("SharedPreferencesConstants isIntroIn: $isIntroIn");
    SharedPreferencesConstants.instance
        .getBooleanValue(SharedPreferencesConstants.LOGGEDIN)
        .then((value) => setState(() {
              isLoggedIn = value;
            }));
    print(" SharedPreferencesConstant sisLoggedIn: $isLoggedIn");
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => _showNextScreen());
  }

  // _showNextScreen() async {
  //   if (isIntroIn) {
  //     if (isLoggedIn) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => DashBoardPage()));
  //     } else {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => LoginPage()));
  //     }
  //   } else {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => IntoductionPage()));
  //   }
  // }
  _showNextScreen() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => IntoductionPage()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.0),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Z',
                              style: GoogleFonts.portLligatSans(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Primarycolur,
                              ),
                              children: [
                                TextSpan(
                                  text: 'p',
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 30),
                                ),
                                TextSpan(
                                  text: '-',
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 30),
                                ),
                                TextSpan(
                                  text: 'App',
                                  style: TextStyle(
                                      color: Primarycolur, fontSize: 30),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.0),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Image(
                        image: AssetImage("Images/qisystems.png"),
                        width: 50,
                      ),
                    ),
                    Text(
                      "Powered By Q.I.Systems",
                      style: SplashsubTextStyle,
                    ),
                    Expanded(
                        child: Text(
                      "www.qisystems.in",
                      style: splashemailTextStyle,
                    ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
