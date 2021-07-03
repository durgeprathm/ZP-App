import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Constant/shared_preference_constants.dart';
import 'package:zpapp/Pages/Dashboard_Page.dart';
import 'package:zpapp/Widget/FadeAnimation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSecure = true;
  String username;
  String Password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Primarycolur, Primarycolur]),
        ),
        child: Column(
          children: [
            FadeAnimation(
              1.4,
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset("Images/splash.png"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(38),
                    topLeft: Radius.circular(38),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      FadeAnimation(
                        1.5,
                        TextFormField(
                          style: AppTextStyle.style(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.envelope,
                                color: Primarycolur,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Primarycolur),
                            ),
                            labelStyle: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          onChanged: (value) {
                            username = value;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeAnimation(
                        1.6,
                        TextFormField(
                          obscureText: _isSecure,
                          style: AppTextStyle.style(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isSecure = !_isSecure;
                                });
                              },
                              child: _isSecure
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.eye,
                                        color: Primarycolur,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.eyeSlash,
                                        color: Primarycolur,
                                      ),
                                    ),
                            ),
                            hintText: 'Password',
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Primarycolur),
                            ),
                            labelStyle: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          onChanged: (value) {
                            Password = value;
                          },
                        ),
                      ),
                      SizedBox(height: 35),
                      FadeAnimation(
                        1.7,
                        GestureDetector(
                          onTap: () {
                            if (username == "QIS" && Password == "qis123") {
                              print("Inside If");
                              print("username //////////${username}");
                              print("Password //////////${Password}");
                              //_sendUserData(username.toString(), Password.toString());

                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) {
                                  return DashBoardPage();
                                }),
                              );

                              var UserID = "1";
                              SharedPreferencesConstants.instance
                                  .setStringValue(
                                      SharedPreferencesConstants.USERID,
                                      UserID);
                              SharedPreferencesConstants.instance
                                  .setBooleanValue(
                                      SharedPreferencesConstants.LOGGEDIN,
                                      true);
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Username Or Password Is Empty",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Primarycolur, Primarycolur],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(5, 5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 32),
                                      child: Text(
                                        'SIGN IN',
                                        style: AppTextStyle.style(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      FadeAnimation(
                        1.7,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Primarycolur,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          1.9,
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(
                                      thickness: 1,
                                    ),
                                  ),
                                ),
                                Text('or',
                                    style: TextStyle(color: Primarycolur)),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(
                                      thickness: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        1.9,
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FadeAnimation(
                                1.10,
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage:
                                        AssetImage("Images/google.png"),
                                  ),
                                ),
                              ),
                              FadeAnimation(
                                1.10,
                                CircleAvatar(
                                  backgroundColor: Primarycolur,
                                  child: CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage:
                                        AssetImage("Images/facebook.png"),
                                  ),
                                ),
                              ),
                              FadeAnimation(
                                1.10,
                                CircleAvatar(
                                  backgroundColor: Primarycolur,
                                  child: CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage:
                                        AssetImage("Images/twitter.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
