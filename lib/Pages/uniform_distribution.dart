import 'package:flutter/material.dart';
import 'package:zpapp/Constant/const.dart';

class Uniform extends StatefulWidget {
  @override
  _UniformState createState() => _UniformState();
}

class _UniformState extends State<Uniform> {
  List<String> classList = ["8th","9th","10th","12th","7th"];
  List<String> subjectList = ["English","Maths","Geography","History","Hindi"];
  List<String> studentNameList = ["Rajat","Sanket","Parful","Parthmesh","Aniket","Anjali","Shubham","Tejas","Shreyash","Priya"];
  List<String> rollNoList = ["12","13","14","15","16","17","18","19","20","21"];
  String Class,Subject,SDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Uniform"),),
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
                  child: Text("Student List",style: TextStyle(color: Primarycolur,fontSize: 18,fontWeight: FontWeight.bold),),
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