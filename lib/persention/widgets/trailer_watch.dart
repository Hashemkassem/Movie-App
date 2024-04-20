// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables, must_be_immutable, avoid_print
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../core/constants/app_string.dart';

class Trailerwatch extends StatefulWidget {
  final String trailerytid;
  const Trailerwatch({
    Key? key,
    required this.trailerytid,
  }) : super(key: key);

  @override
  State<Trailerwatch> createState() => _TrailerwatchState();
}

class _TrailerwatchState extends State<Trailerwatch> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoid = YoutubePlayer.convertUrlToId(widget.trailerytid);
    _controller = YoutubePlayerController(
      initialVideoId: videoid.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        forceHD: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('from trailer${widget.trailerytid.toString()}');
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: YoutubePlayer(
        thumbnail: Image.network(
          "https://img.youtube.com/vi/ ${widget.trailerytid}/hqdefault.jpg",
          fit: BoxFit.cover,
        ),
        controlsTimeOut: const Duration(milliseconds: 1500),
        aspectRatio: 16 / 9,
        controller: _controller,
        showVideoProgressIndicator: true,
        bufferIndicator: const Center(
          child: Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          )),
        ),
        progressIndicatorColor: maincolor,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
              isExpanded: true,
              colors: const ProgressBarColors(
                playedColor: whitecolor,
                handleColor: maincolor,
              )),
          RemainingDuration(),
          FullScreenButton(),
        ],
      ),
    );
  }
}
