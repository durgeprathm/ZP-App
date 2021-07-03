import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zpapp/Constant/const.dart';

class LatestSyllabus extends StatefulWidget {
  @override
  _LatestSyllabusState createState() => _LatestSyllabusState();
}

class _LatestSyllabusState extends State<LatestSyllabus> {

  List<String> syllabusnameList = ["Syllabus 1","Syllabus 2","Syllabus 3","Syllabus 4","Syllabus 5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Learning Material"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:  ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, int index) {
                return HomeOptions(syllabusnameList[index],index);
              }
          ),
        ),
      ),
    );
  }
}


class HomeOptions extends StatelessWidget {
  HomeOptions(this.Names,this.index);
  String Names;
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Primarycolur,
              width: 2,
            )
        ),
        child: ListTile(
          title: Padding(
              padding: EdgeInsets.only(left:15.5,bottom: 5.0,top: 15.5,right: 10.5),
              child: Text(Names,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          subtitle: Padding(
            padding: const EdgeInsets.only(left:15.5,bottom: 5.0,top: 5,right: 10.5),
            child: Text("25-Nov-2020"),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
            child: FaIcon(FontAwesomeIcons.chevronCircleRight,size: 30,color: Primarycolur,),
          ),
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder:
            //         (context) =>
            //         VideosPage(URL,"Video Name ${index+1}")
            //     )
            // );
          },
        ),
      ),
    );
  }
}
