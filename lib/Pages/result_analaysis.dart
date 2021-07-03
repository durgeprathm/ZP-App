import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zpapp/Constant/const.dart';

class ResultAnalaysis extends StatefulWidget {
  @override
  _ResultAnalaysisState createState() => _ResultAnalaysisState();
}

class _ResultAnalaysisState extends State<ResultAnalaysis> {

  List<String> classList = ["8th","9th","10th","12th","7th"];
  List<String> subjectList = ["English","Maths","Geography","History","Hindi"];
  List<String> studentNameList = ["Rajat","Sanket","Parful","Parthmesh","Aniket","Anjali","Shubham","Tejas","Shreyash","Priya"];
  String Class,Subject,SDate,Studentname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result Form"),),
      body: SafeArea(
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
              Row(
                children: [
                  Expanded(
                    child: Padding(
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
                                    hint: Text( "Student Name"),
                                    value: Studentname,
                                    isDense: true,
                                    items: studentNameList
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        Studentname = newValue;
                                        print(Studentname);
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          // amount = int.parse(value);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Roll No',
                            hintText: "Eg: 10"
                        ),
                      ),
                    ),
                  ),


                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          // amount = int.parse(value);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Marks Obtanined',
                            hintText: "Eg: 10"
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Out of"),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          // amount = int.parse(value);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Max Marks',
                            hintText: "Eg: 10"
                        ),
                      ),
                    ),
                  ),
                ],
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
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


