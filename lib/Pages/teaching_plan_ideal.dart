import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:zpapp/Constant/const.dart';

class IdealPlan extends StatefulWidget {
  @override
  _IdealPlanState createState() => _IdealPlanState();
}

class _IdealPlanState extends State<IdealPlan> {
  final format = DateFormat("yyyy-MM-dd");
  bool autoValidate = false;
  int changedCount = 0;
  int savedCount = 0;
  bool showResetIcon = false;
  bool readOnly = false;
  DateTime value = DateTime.now();

  TextEditingController _SDatetext = new TextEditingController();
  List<String> subjectList = [
    "English",
    "Maths",
    "Geography",
    "History",
    "Hindi"
  ];
  List<String> topicList = [
    "English",
    "Maths",
    "Geography",
    "History",
    "Hindi"
  ];
  String Subject, Topic, SDate;

  final _textsubjectcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Ideal Plan"),
        backgroundColor: Primarycolur,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
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
                      //autovalidate: autoValidate,
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
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, right: 0.0, left: 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.calendar,
                            color: Primarycolur,
                          ),
                        ),
                        labelText: 'Date',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                hintStyle: styleDropdownSearch,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, right: 0.0, left: 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.list,
                                    color: Primarycolur,
                                  ),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text("Select Subject"),
                                  value: Subject,
                                  isDense: true,
                                  items: subjectList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                        // child: DropdownSearch<String>(
                        //   searchBoxController: _textsubjectcontroller,
                        //   items: subjectList,
                        //   showClearButton: true,
                        //   showSearchBox: true,
                        //   label: 'Select Subject',
                        //   hint: "Select Subject",
                        //   //autoValidateMode: AutovalidateMode.onUserInteraction,
                        //   validator: (value) {
                        //     if (value == null) {
                        //       return 'This is required';
                        //     }
                        //   },
                        //   onSaved: (String value) {
                        //     _textsubjectcontroller.text = value.toString();
                        //   },
                        //   dropdownSearchDecoration: InputDecoration(
                        //     hintStyle: styleDropdownSearch,
                        //     prefixIcon: Padding(
                        //       padding: const EdgeInsets.only(
                        //           top: 12.0, right: 0.0, left: 0.0),
                        //       child: FaIcon(
                        //         FontAwesomeIcons.list,
                        //         color: Primarycolur,
                        //       ),
                        //     ),
                        //     //border: OutlineInputBorder(),
                        //   ),
                        //   onChanged: (newValue) {
                        //     setState(
                        //       () {},
                        //     );
                        //   },
                        // ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                hintStyle: styleDropdownSearch,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, right: 0.0, left: 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.list,
                                    color: Primarycolur,
                                  ),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text("Select Topic"),
                                  value: Topic,
                                  isDense: true,
                                  items: topicList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      Topic = newValue;
                                      print(Topic);
                                      // widget.getDropDownValue(newValue, widget.id);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      )),
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
                              FontAwesomeIcons.solidSave,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                        minWidth: 150,
                        height: 25.0,
                        onPressed: () async {},
                      ),
                    ),
                  ),
                  Divider(
                    height: 4,
                    thickness: 2.0,
                    color: Primarycolur,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: DataTable(columns: [
                      DataColumn(
                          label: Container(
                        width: 20,
                        child: Text('Sr No',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      )),
                      DataColumn(
                          label: Container(
                        width: 70,
                        child: Text('Subject',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Container(
                          width: 20,
                          child: Text('Topic',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Container(
                          width: 70,
                          child: Text('Date',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      )),
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Text("1")),
                        DataCell(Text("English")),
                        DataCell(Text("English")),
                        DataCell(Text("25-11-2020")),
                      ])
                    ]),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
