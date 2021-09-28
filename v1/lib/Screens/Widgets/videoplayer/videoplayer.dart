import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'video_list.dart';

class VideoPlayer extends StatefulWidget {
  String vlink;
  VideoPlayer({this.vlink});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  // PlayerState _playerState;
  // YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  //String videoId;
  // final List<String> _ids = [
  //   'OTmQOjsl0eg',
  //   'hKB-YGF14SY',
  //   'gQDByCdjUXw',
  //   'vwHovI3x3cY',
  //   '_WoCV4c6XOE',
  //   'KmzdUe0RSJo',
  //   '6jZDSSZZxjQ',
  //   'p2lYr3vM_1w',
  //   '7QUtEmBT_-w',
  //   '34_PXCzGw1M',
  // ];

  //String videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=OTmQOjsl0eg");
//print(videoId); //
  @override
  void initState() {
    String videoId = YoutubePlayer.convertUrlToId(widget.vlink);

    super.initState();
    _controller = YoutubePlayerController(
      // initialVideoId: _ids.first,
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: true,
        enableCaption: true,
        hideThumbnail: true,
        //hideControls: true,
      ),
      //)..addListener(listener);
    );
    //  _idController = TextEditingController();
    //  _seekToController = TextEditingController();
    //  _videoMetaData = YoutubeMetaData();
    // _playerState = PlayerState.unknown;
  }

  // void listener() {
  //   if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
  //     setState(() {
  //      // _playerState = _controller.value.playerState;
  //       _videoMetaData = _controller.metadata;
  //     });
  //   }
  // }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            onReady: () {
              _isPlayerReady = true;
            },
          ),
        ],
      ),
    );
  }
}
