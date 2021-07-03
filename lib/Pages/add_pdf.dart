import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zpapp/Constant/const.dart';

class AddPDF extends StatefulWidget {
  @override
  _AddPDFState createState() => _AddPDFState();
}

class _AddPDFState extends State<AddPDF> {
  List<String> subjectList = [
    "English",
    "Maths",
    "Geography",
    "History",
    "Hindi"
  ];
  List<String> classList = ["7th","8th","9th","10th","12th"];
  String Subject, topic;
  PickedFile picture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "Add PDF Notes",
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
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
                                      hint: Text("Select Class"),
                                      value: Subject,
                                      isDense: true,
                                      items: classList
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
                                      hint: Text("Select Subject"),
                                      value: topic,
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
                                          topic = newValue;
                                          print(topic);
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
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            // amount = int.parse(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'Notes Name',
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
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            // amount = int.parse(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'Notes Description',
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
                        padding: EdgeInsets.all(10),
                        child: Material(
                          color: Primarycolur,
                          borderRadius: BorderRadius.circular(5.0),
                          child: MaterialButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.filePdf,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  "Get PDF",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                            minWidth: 150,
                            height: 25.0,
                            onPressed: () async {
                              final _picker = ImagePicker();
                              picture = await _picker.getVideo(
                                  source: ImageSource.gallery);
                              print(picture);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
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
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
