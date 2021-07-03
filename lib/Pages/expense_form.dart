import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zpapp/Constant/const.dart';

class ExpensesForm extends StatefulWidget {
  @override
  _ExpensesFormState createState() => _ExpensesFormState();
}

class _ExpensesFormState extends State<ExpensesForm> {
  DateTime value = DateTime.now();
  int changedCount = 0;
  int savedCount = 0;
  final format = DateFormat("yyyy-MM-dd");
  bool autoValidate = false;
  bool showResetIcon = false;
  bool readOnly = false;
  final picker = ImagePicker();
  String _imageFilePath;
  File _image;
  String SDate;
  TextEditingController _SDatetext = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Form"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0) ,
                  child: DateTimeField(
                    format: format,
                    controller: _SDatetext,
                    onShowPicker: (context,
                        currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate:
                          currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(
                            date, time);
                      } else {
                        return currentValue;
                      }
                    },
                    //autovalidate: autoValidate,
                    validator: (date) =>
                    date == null ? 'Invalid date' : null,
                    onChanged: (date) =>
                        setState(() {
                          var formattedDate = "${value.day}-${value.month}-${value.year}";
                          changedCount++;
                          SDate = formattedDate.toString();
                          print(SDate);
                        }),
                    resetIcon: showResetIcon ? Icon(Icons.delete) : null,
                    readOnly: readOnly,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date',
                      // errorText: _SDatevalidate
                      //     ? 'Enter Sales Date'
                      //     : null,
                      // helperText: 'Changed: $changedCount, Saved: $savedCount, $value',
                      // hintText: "Deactivated At: "
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
                      border: OutlineInputBorder(),
                      labelText: 'Expense Amount',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    obscureText: false,
                    maxLines: 2,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      // amount = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expenses',
                    ),
                  ),
                ),
                Divider(
                  color: Primarycolur,
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Material(
                    color: Primarycolur,
                    borderRadius: BorderRadius.circular(15.0),
                    child: MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.camera,color: Colors.white,),
                          SizedBox(width: 15.0,),
                          Text("Proof",style: TextStyle(color: Colors.white),)
                        ],
                      ) ,
                      minWidth: 150,
                      height: 25.0,
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Material(
                    color: Primarycolur,
                    borderRadius: BorderRadius.circular(15.0),
                    child: MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.solidSave,color: Colors.white,),
                          SizedBox(width: 15.0,),
                          Text("Save",style: TextStyle(color: Colors.white),)
                        ],
                      ) ,
                      minWidth: 150,
                      height: 25.0,
                      onPressed: () {
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
  Future getImage() async {
    print('getImage() Call');
    final pickedFile =
    await picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imageFilePath = pickedFile.path;
        print('_image Path Call : ${_imageFilePath}');
      } else {
        print('No image selected.');
      }
    });
  }
}
