import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Pages/add_questions.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final format = DateFormat("yyyy-MM-dd");
  bool autoValidate = false;
  bool showResetIcon = false;
  bool readOnly = false;
  DateTime value = DateTime.now();
  int changedCount = 0;
  int savedCount = 0;
  String SDate;
  TextEditingController _SDatetext = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Quiz"),
        backgroundColor: Primarycolur,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      // amount = int.parse(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Test Name',
                      hintStyle: styleDropdownSearch,
                      // prefixIcon: Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 12.0, right: 0.0, left: 0.0),
                      //   child: FaIcon(
                      //     FontAwesomeIcons.list,
                      //     color: Primarycolur,
                      //   ),
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: DateTimeField(
                    format: format,
                    controller: _SDatetext,
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(date, time);
                      } else {
                        return currentValue;
                      }
                    },
                    // autovalidate: autoValidate,
                    validator: (date) => date == null ? 'Invalid date' : null,
                    onChanged: (date) => setState(() {
                      var formattedDate =
                          "${value.day}-${value.month}-${value.year}";
                      changedCount++;
                      SDate = formattedDate.toString();
                      print(SDate);
                    }),
                    resetIcon: showResetIcon ? Icon(Icons.delete) : null,
                    readOnly: readOnly,
                    decoration: InputDecoration(
                      hintStyle: styleDropdownSearch,
                      labelText: 'Test Date',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, right: 0.0, left: 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.calendar,
                          color: Primarycolur,
                        ),
                      ),
                    ),
                  ),
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
                            labelText: 'No of Questions',
                            hintStyle: styleDropdownSearch,
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 12.0, right: 0.0, left: 0.0),
                            //   child: FaIcon(
                            //     FontAwesomeIcons.list,
                            //     color: Primarycolur,
                            //   ),
                            // ),
                          ),
                        ),
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
                            labelText: 'Marks for each',
                            hintStyle: styleDropdownSearch,
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 12.0, right: 0.0, left: 0.0),
                            //   child: FaIcon(
                            //     FontAwesomeIcons.list,
                            //     color: Primarycolur,
                            //   ),
                            // ),
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
                            labelText: 'Passing Marks',
                            hintStyle: styleDropdownSearch,
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 12.0, right: 0.0, left: 0.0),
                            //   child: FaIcon(
                            //     FontAwesomeIcons.list,
                            //     color: Primarycolur,
                            //   ),
                            // ),
                          ),
                        ),
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
                            labelText: 'Total Time',
                            hintText: 'Eg: 45 mins',
                            hintStyle: styleDropdownSearch,
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 12.0, right: 0.0, left: 0.0),
                            //   child: FaIcon(
                            //     FontAwesomeIcons.list,
                            //     color: Primarycolur,
                            //   ),
                            // ),
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
                    borderRadius: BorderRadius.circular(5.0),
                    child: MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.arrowAltCircleRight,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Procced",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      minWidth: 150,
                      height: 25.0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddQuestions()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
