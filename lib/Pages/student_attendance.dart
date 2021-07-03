import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zpapp/Constant/const.dart';


class StudentAttendance extends StatefulWidget {
  @override
  _StudentAttendanceState createState() => _StudentAttendanceState();
}
enum SingingCharacter {Absent,Present }

class _StudentAttendanceState extends State<StudentAttendance> {

  SingingCharacter _character = SingingCharacter.Absent;

  List<String> classList = ["8th","9th","10th","12th","7th"];
  List<String> subjectList = ["English","Maths","Geography","History","Hindi"];
  List<String> studentNameList = ["Rajat","Sanket","Parful","Parthmesh","Aniket","Anjali","Shubham","Tejas","Shreyash","Priya"];
  List<String> rollNoList = ["12","13","14","15","16","17","18","19","20","21"];
  String Class,Subject,SDate;
  bool checklist;
  PickedFile image;
  File fileimage = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Attendance"),

      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text( "Select Class"),
                                value: Class,
                                isDense: true,
                                items: classList
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    Class = newValue;
                                    print(Class);
                                    // widget.getDropDownValue(newValue, widget.id);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text( "Select Subject"),
                                value: Subject,
                                isDense: true,
                                items: subjectList
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    Subject = newValue;
                                    print(Subject);
                                    // widget.getDropDownValue(newValue, widget.id);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    )
                ),
                fileimage == null ?
                Center(child: GestureDetector(
                  onTap: () async {
                    final _picker = ImagePicker();
                    image = await _picker.getImage(source: ImageSource.camera);
                    setState(() {
                      fileimage =  File(image.path);
                    });
                  },
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff409b94)
                          )),
                      child: Image.asset("Images/3901.png",width: 100,)),
                ),
                ) : Center(
                  child: Image.file(fileimage,width: 100),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Material(
                    color: Primarycolur,
                    borderRadius: BorderRadius.circular(15.0),
                    child: MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.solidSave,color: Colors.white,),
                          SizedBox(width: 15.0,),
                          Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
                        ],
                      ) ,
                      minWidth: 150,
                      height: 25.0,
                      onPressed: () async {
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                          msg: "Submited",
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Primarycolur,
                          textColor: Color(0xffffffff),
                          gravity: ToastGravity.BOTTOM,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Student List",style: TextStyle(color: Primarycolur,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text('Absent'),
                            leading: Radio(
                              value: SingingCharacter.Absent,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                  checklist = false;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Present'),
                            leading: Radio(
                              value: SingingCharacter.Present,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                  checklist = true;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                Divider(
                  height: 3,
                  thickness: 2.0,
                  color: Primarycolur,
                ),
                Container(
                    height: 500,
                    child:  ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, int index) {
                          return StudentTile(studentNameList[index],rollNoList[index],index);
                        }
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentTile extends StatefulWidget {

  StudentTile(this.StudentName,this.RollNo,this.index);
  final String StudentName;
  final String RollNo;
  final int index;


  @override
  _StudentTileState createState() => _StudentTileState();
}

class _StudentTileState extends State<StudentTile> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Name: ${widget.StudentName}"),
      subtitle: Text("Roll No: ${widget.RollNo}"),
      trailing:  Checkbox(
        value: checkedValue,
        onChanged: (newValue) {
          setState(() {
            checkedValue = newValue;
          });
        },
      ),
    );
  }
}
