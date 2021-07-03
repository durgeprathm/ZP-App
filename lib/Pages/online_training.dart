import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:zpapp/Adapter/getLiveVidoeID.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/YTLive/YoutubeLive.dart';



class OnlineTraining extends StatefulWidget {
  @override
  _OnlineTrainingState createState() => _OnlineTrainingState();
}

class _OnlineTrainingState extends State<OnlineTraining> {


  LiveLectureData liveLectureData = new LiveLectureData();
  String LIVEID;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Online Training"),),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child:   Padding(
                padding: EdgeInsets.all(10),
                child: Material(
                  color: Primarycolur,
                  borderRadius: BorderRadius.circular(15.0),
                  child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FaIcon(FontAwesomeIcons.video,color: Colors.white,),
                        SizedBox(width: 15.0,),
                        Text("Watch Live",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
                      ],
                    ) ,
                    minWidth: 150,
                    height: 25.0,
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      var LIVEVIDEOID = await liveLectureData.getLiveVideoData("mcj-std2", "2", "101");
                      LIVEID = LIVEVIDEOID["stream_id"];
                      print(LIVEVIDEOID);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YoutubeLiveVideos(LIVEID))
                      );
                      setState(() {
                        showSpinner = false;
                      });

                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
