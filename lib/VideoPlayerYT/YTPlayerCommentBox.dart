import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:zpapp/VideoPlayerYT/play_pause_button_bar.dart';
import 'package:zpapp/VideoPlayerYT/volume_slider.dart';

import 'meta_data_section.dart';
//VideosPageCommentBoxYT

class VideosPageCommentBoxYT extends StatefulWidget {

  VideosPageCommentBoxYT(this.USERNAME,this.STUDID,this.URL,this.videoname,this.NOTESID);
  final String USERNAME;
  final  String STUDID;
  final String URL;
  final String videoname;
  final String NOTESID;


  @override
  _VideosPageCommentBoxYTState createState() => _VideosPageCommentBoxYTState();
}

class _VideosPageCommentBoxYTState extends State<VideosPageCommentBoxYT> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  YoutubePlayerController  _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId(widget.URL),
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
      ),
    )..listen((value) {
      if (value.isReady && !value.hasPlayed) {
        _controller
          ..hidePauseOverlay()
          ..hideTopMenu();
      }
    });
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 5), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
      log('Exited Fullscreen');
    };
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        appBar: AppBar(
          title:Text(widget.videoname),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (kIsWeb && constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: player),
                  const SizedBox(
                    width: 500,
                    child: SingleChildScrollView(
//                      child: Controls(widget.USERNAME,widget.STUDID,widget.NOTESID),
                    ),
                  ),
                ],
              );
            }
            return ListView(
              children: [
                player,
                Controls(widget.USERNAME,widget.STUDID,widget.NOTESID),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

}
class Controls extends StatefulWidget {
  Controls(this.USERNAME,this.STUDID,this.NOTESID);
  final String USERNAME;
  final String STUDID;
  final String NOTESID;
  @override
  _ControlsState createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _space,
          MetaDataSection(),
          _space,
          PlayPauseButtonBar(),
          _space,
          VolumeSlider(),
          _space,
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}

