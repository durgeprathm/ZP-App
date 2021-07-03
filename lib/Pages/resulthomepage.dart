import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Pages/result_analaysis.dart';


class ResultHomepage extends StatefulWidget {
  @override
  _ResultHomepageState createState() => _ResultHomepageState();
}

class _ResultHomepageState extends State<ResultHomepage> {

  List<String> studentNameList = ["Rajat","Sanket","Parful","Parthmesh","Aniket","Anjali","Shubham","Tejas","Shreyash","Priya"];
  List<String> marksList = ["25","50","95","70","25","23","25","80","65","77"];
  List<String> perList = ["25%","50%","95%","70%","25%","23%","25%","80%","65%","77%"];
  List<String> rollList = ["30","31","32","33","34","35","36","37","38","39"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Analaysis"),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return ResultAnalaysis();
                  }));
                },
                child: FaIcon(FontAwesomeIcons.plus),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:  ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, int index) {
                return HomeOptions(studentNameList[index],marksList[index],perList[index],index,rollList[index]);
              }
          ),
        ),
      ),
    );
  }
}


class HomeOptions extends StatelessWidget {
  HomeOptions(this.Names,this.marks,this.percentage,this.index,this.rollno);

  String Names;
  String marks;
  String percentage;
  int index;
  String rollno;

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
              child: Text("$Names - $rollno" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          subtitle: Padding(
            padding: const EdgeInsets.only(left:15.5,bottom: 5.0,top: 5,right: 10.5),
            child: Text("$marks out of 100"),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Primarycolur,
              child: Text(percentage,style: TextStyle(color: Colors.white),),
            )
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
