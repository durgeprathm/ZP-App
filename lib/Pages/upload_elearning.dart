import 'package:flutter/material.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/material_color_generator.dart';
import 'add_pdf.dart';
import 'add_videos.dart';

class UploadElearning extends StatefulWidget {
  @override
  _UploadElearningState createState() => _UploadElearningState();
}

class _UploadElearningState extends State<UploadElearning> {
  @override
  Widget build(BuildContext context) {
    MaterialColor primarySwatch = generateMaterialColor(Color(0xff419B95));
    return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Upload Material"),
              backgroundColor: Primarycolur,
              leading: IconButton(
                icon: Icon(
                    Icons.arrow_back
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorColor: Primarycolur,
                tabs: [
                  Tab(
                      icon: Icon(Icons.videocam,
                      color:Colors.white,
                      ),
                      text: "Video Notes "
                  ),
                  Tab(
                      icon: Icon(Icons.picture_as_pdf,
                        color:Colors.white,
                      ),
                      text: "PDF Notes",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                AddVideos(),
                AddPDF()
              ],
            ),
          ),
        );
  }
}
