import 'package:flutter/material.dart';
const Color Primarycolur = Color(0xff419B95);
const String ruppe = "₹";
TextStyle SplashsubTextStyle = TextStyle(
  // fontSize: ScreenUtil.getInstance().setSp(45),
    fontSize: 16.0,
    color: Primarycolur,
    letterSpacing: .6);

TextStyle splashemailTextStyle = TextStyle(
  // fontSize: ScreenUtil.getInstance().setSp(45),
    fontSize: 12.0,
    color:Primarycolur,
    letterSpacing: .6);


mixin AppColor {
  static Color primary = Color(0xFF2855AE);
  static Color primaryLight = Color(0xFF7292CF);
  static Color darkText = Color(0xFF777777);
}

//-------------------------------
mixin AppTextStyle {
  static const primaryText =
  TextStyle(fontSize: 18, color: Colors.white, fontFamily: "SourceSansPro");

  static TextStyle style(
      {double fontSize = 18,
        Color color = Colors.white,
        FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: "SourceSansPro",
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight);
}
//-------------------------------


TextStyle styleDropdownSearch = TextStyle(fontSize: 20.0);
TextStyle featuretext = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.normal,
);