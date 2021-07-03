import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zpapp/Constant/const.dart';
class AddQuestions extends StatefulWidget {
  @override
  _AddQuestionsState createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {

  List<String> optionList = ["Option A","Option B","Option C","Option D"];
  String Optionname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizs"),
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
                    maxLines: 4,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      // amount = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Question',
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
                      labelText: 'Enter Option A',
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
                      labelText: 'Enter Option B',
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
                      labelText: 'Enter Option C',
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
                      labelText: 'Enter Option D',
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
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text( "Set Correct Answer"),
                                value: Optionname,
                                isDense: true,
                                items: optionList
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    Optionname = newValue;
                                    print(Optionname);
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
                  padding: EdgeInsets.all(10),
                  child: Material(
                    color: Primarycolur,
                    borderRadius: BorderRadius.circular(15.0),
                    child: MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.arrowAltCircleRight,color: Colors.white,),
                          SizedBox(width: 15.0,),
                          Text("Procced",style: TextStyle(color: Colors.white),)
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
}
