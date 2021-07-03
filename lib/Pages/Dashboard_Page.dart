import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Pages/LoginPage2.dart';
import 'package:zpapp/Pages/admission_inita.dart';
import 'package:zpapp/Pages/expense_record.dart';
import 'package:zpapp/Pages/quiz_page.dart';
import 'package:zpapp/Pages/resulthomepage.dart';
import 'package:zpapp/Pages/student_attendance.dart';
import 'package:zpapp/Pages/teaching_plan.dart';
import 'package:zpapp/Pages/uniform_distribution.dart';
import 'package:zpapp/Pages/upload_elearning.dart';
import 'package:zpapp/day_satrt.dart';

import 'book_distribution.dart';
import 'fdp_page.dart';
import 'latest_syllabus.dart';
import 'online_training.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

List<String> titleList = [
  "Day Start",
  "Teaching Plan",
  "FDP",
  "Online Training",
  "Student Attendance",
  "Latest Syllabus",
  "Result Analysis",
  "Upload Material",
  "Quiz",
  "Book Distribution",
  "Uniform Distribution",
  "Admission Initiative",
  "Expense Record"
];
List<String> iconList = [
  "Images/calender2.png",
  "Images/marketing-strategy.png",
  "Images/onlineedu.png",
  "Images/online-learning.png",
  "Images/student (1).png",
  "Images/book.png",
  "Images/analysis.png",
  "Images/upload-file.png",
  "Images/quiz.png",
  "Images/books (1).png",
  "Images/uniform.png",
  "Images/student (2).png",
  "Images/list (1).png"
];

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  String _selectdate = DateFormat('dd/MM/yyyy').format(new DateTime.now());
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Primarycolur,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.0),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('Images/Userimage.jpg'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Yogesh Watile",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("Images/house.png")),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Primarycolur,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("Images/programmer.png")),
              title: Text(
                'View Profile',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Primarycolur,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("Images/call-center.png")),
              title: Text(
                'Support',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Primarycolur,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("Images/feedback.png")),
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Primarycolur,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
                leading: Container(
                    width: MediaQuery.of(context).size.width / 15,
                    child: Image.asset("Images/logout.png")),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Primarycolur,
                  ),
                ),
                onTap: () async {
                  //await SharedPreferencesConstants.instance.removeAll();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) {
                      return LoginScreen();
                    }),
                  );
                }),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("SES"),
        backgroundColor: Primarycolur,
        elevation: 0.1,
      ),
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: new BoxDecoration(
                color: Primarycolur,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 90.0)),
              ),
            ),
            flex: 4,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 5,
          ),
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[
            header,
            grid,
          ],
        ),
      );

  get header => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            //contentPadding: EdgeInsets.only(left: 20, right: 20),
            ),
      );

  get grid => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: .90,
            children: List.generate(13, (index) {
              return GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DayStart()));
                        Fluttertoast.showToast(
                          msg: "Day Starting as.... $_selectdate",
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Primarycolur,
                          textColor: Color(0xffffffff),
                          gravity: ToastGravity.BOTTOM,
                        );
                      }
                      break;
                    case 1:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TeachingPlan()));
                      }
                      break;
                    case 2:
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => FDPPage()));
                      }
                      break;
                    case 3:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnlineTraining()));
                      }
                      break;
                    case 4:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentAttendance()));
                      }
                      break;
                    case 5:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LatestSyllabus()));
                      }
                      break;
                    case 6:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultHomepage()));
                      }
                      break;
                    case 7:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadElearning()));
                      }
                      break;
                    case 8:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizPage()));
                      }
                      break;
                    case 9:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookDistribution()));
                      }
                      break;
                    case 10:
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Uniform()));
                      }
                      break;
                    case 11:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Addmission()));
                      }
                      break;
                    case 12:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExpenseRecord()));
                      }
                      break;
                  }
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 30,
                            ),
                            Text(
                              _selectdate,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Primarycolur),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 7,
                          child: Image.asset(
                            iconList[index],
                          ),
                        ),
                        Text(
                          titleList[index],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Primarycolur),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
}
