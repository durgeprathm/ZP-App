import 'package:flutter/material.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Pages/pdflistpage.dart';
import 'package:zpapp/Pages/ytvideolist_page.dart';
import 'package:zpapp/material_color_generator.dart';

class FDPPage extends StatefulWidget {
  @override
  _FDPPageState createState() => _FDPPageState();
}

class _FDPPageState extends State<FDPPage> {
  @override
  Widget build(BuildContext context) {
    MaterialColor primarySwatch = generateMaterialColor(Color(0xff419B95));
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Primarycolur,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("FDP Page"),
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorColor: Primarycolur,
                tabs: [
                  Tab(icon: Icon(Icons.video_label), text: "Videos"),
                  Tab(icon: Icon(Icons.receipt), text: "PDF"),
                ],
              ),
            ),
            body: TabBarView(
              children: [YtVideoPageList(), PdfListPage()],
            )));
  }
}
