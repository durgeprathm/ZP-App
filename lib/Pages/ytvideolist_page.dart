import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/VideoPlayerYT/VideosPage.dart';

class YtVideoPageList extends StatefulWidget {
  @override
  _YtVideoPageListState createState() => _YtVideoPageListState();
}

class _YtVideoPageListState extends State<YtVideoPageList> {
  List<String> videoList = [
    "https://www.youtube.com/watch?v=k1RI5locZE4",
    "https://www.youtube.com/watch?v=SY4TWhXyr0I",
    "https://www.youtube.com/watch?v=s6LrBex9NPA",
    "https://www.youtube.com/watch?v=hQcFE0RD0cQ",
    "https://www.youtube.com/watch?v=98epYlZrU6U",
    "https://www.youtube.com/watch?v=k1RI5locZE4",
    "https://www.youtube.com/watch?v=SY4TWhXyr0I",
    "https://www.youtube.com/watch?v=s6LrBex9NPA",
    "https://www.youtube.com/watch?v=hQcFE0RD0cQ",
    "https://www.youtube.com/watch?v=98epYlZrU6U"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, int index) {
                return HomeOptions(videoList[index], index);
              }),
        ),
      ),
    );
  }
}

class HomeOptions extends StatelessWidget {
  HomeOptions(this.URL, this.index);
  String URL;
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 10,
                  child: Image.asset("Images/video-player.png")),
              title: Text(
                "Video Name ${index + 1}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Primarycolur),
              ),
              subtitle: Text("25-Nov-2020"),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 45,
                  child: Image.asset(
                    "Images/next.png",
                    color: Primarycolur,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VideosPage(URL, "Video Name ${index + 1}")));
              },
            ),
            // Divider(
            //   thickness: 1.0,
            // )
          ],
        ),
      ),
    );
  }
}
