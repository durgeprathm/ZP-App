import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zpapp/Constant/const.dart';

class Addmission extends StatefulWidget {
  @override
  _AddmissionState createState() => _AddmissionState();
}

enum SingingCharacter { Pro, NoPro }

class _AddmissionState extends State<Addmission> {
  SingingCharacter _character = SingingCharacter.Pro;
  final picker = ImagePicker();
  String _imageFilePath;
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admission"),
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
                      labelText: ' Name',
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
                      labelText: 'Mobile No',
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
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      // amount = int.parse(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Student Name & Age',
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
                      labelText: 'Class',
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
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      // amount = int.parse(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Parent Review',
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
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            'Prominant',
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Radio(
                            value: SingingCharacter.Pro,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Non-Prominant',
                              style: TextStyle(fontSize: 15)),
                          leading: Radio(
                            value: SingingCharacter.NoPro,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Material(
                    color: Primarycolur,
                    borderRadius: BorderRadius.circular(5.0),
                    child: MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.camera,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Proof",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
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
                    borderRadius: BorderRadius.circular(5.0),
                    child: MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      minWidth: 150,
                      height: 25.0,
                      onPressed: () {},
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
