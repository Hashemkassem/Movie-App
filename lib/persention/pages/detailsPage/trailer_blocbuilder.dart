// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bussnic_logic/cubit/video/cubit/video_get_cubit.dart';
import 'package:movie_app/data/models/videos_model.dart';
import 'package:movie_app/persention/widgets/trailer_watch.dart';

class TrailerBlocBuilder extends StatefulWidget {
  late List<VideoModel> videolist;
  final String type;
  final int id;

  TrailerBlocBuilder(
      {super.key,
      required this.videolist,
      required this.type,
      required this.id});

  @override
  State<TrailerBlocBuilder> createState() => _TrailerBlocBuilderState();
}

class _TrailerBlocBuilderState extends State<TrailerBlocBuilder> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoGetCubit, VideoGetState>(
      builder: (context, state) {
        if (state is VideoLoaded) {
          widget.videolist = (state).videos;
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.manual,
                                  overlays: [SystemUiOverlay.bottom]);
                              SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.manual,
                                  overlays: []);
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                              Navigator.pop(context);
                            },
                            child: Trailerwatch(
                                trailerytid:
                                    widget.videolist[index].key.toString())),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is VideoError) {
          return Center(
            child: Image.asset('asset/lottie/Animation - 1710423869605.gif'),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                widget.videolist = BlocProvider.of<VideoGetCubit>(context)
                    .fetchVideos(widget.type, widget.id);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Try Again",
                  style: TextStyle(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
