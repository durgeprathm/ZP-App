import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Pages/admission_inita.dart';
import 'package:zpapp/Pages/book_distribution.dart';
import 'package:zpapp/Pages/fdp_page.dart';
import 'package:zpapp/Pages/latest_syllabus.dart';
import 'package:zpapp/Pages/online_training.dart';
import 'package:zpapp/Pages/quiz_page.dart';
import 'package:zpapp/Pages/resulthomepage.dart';
import 'package:zpapp/Pages/student_attendance.dart';
import 'package:zpapp/Pages/teaching_plan.dart';
import 'package:zpapp/Pages/uniform_distribution.dart';
import 'package:zpapp/Pages/upload_elearning.dart';
import 'package:zpapp/day_satrt.dart';

import 'expense_record.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> titleList = [
    "Day Start",
    "Teaching Plan",
    "FDP",
    "Online Training",
    "Student Attendance",
    "Latest Syllabus",
    "Result Analysis",
    "Upload E-Learing Material",
    "Quiz",
    "Book Distribution",
    "Uniform Distribution",
    "Admission Initiative",
    "Expense Record"
  ];
  List<String> iconList = [
    "calendar.png",
    "planning.png",
    "onlineedu.png",
    "onlineedu.png",
    "student.png",
    "book.png",
    "notepad.png",
    "upload.png",
    "quiz.png",
    "distributed.png",
    "distributed.png",
    "clipboard.png",
    "accounting.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SES"),
        backgroundColor: Primarycolur,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 13,
                    itemBuilder: (context, int index) {
                      return HomeOptions(
                          titleList[index], index, iconList[index]);
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeOptions extends StatelessWidget {
  final String Titlename;
  final int choice;
  String customicon;
  HomeOptions(this.Titlename, this.choice, this.customicon);
  String _selectdate = DateFormat('dd/MM/yyyy').format(new DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Primarycolur,
              width: 2,
            )),
        child: ListTile(
          title: Padding(
              padding: EdgeInsets.only(
                  left: 15.5, bottom: 5.0, top: 15.5, right: 10.5),
              child: Text(
                Titlename,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          subtitle: Padding(
            padding: const EdgeInsets.only(
                left: 15.5, bottom: 5.0, top: 5, right: 10.5),
            child: Text(_selectdate),
          ),
          trailing: Image.asset("Images/$customicon"),
          onTap: () {
            switch (choice) {
              case 0:
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DayStart()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeachingPlan()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuizPage()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Addmission()));
                }
                break;
              case 12:
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExpenseRecord()));
                }
                break;
            }
          },
        ),
      ),
    );
  }
}
