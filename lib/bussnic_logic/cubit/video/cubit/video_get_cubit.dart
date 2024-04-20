import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/videos_model.dart';
import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'video_get_state.dart';

class VideoGetCubit extends Cubit<VideoGetState> {
  List<VideoModel> videos = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;
  VideoGetCubit(this.movie1repo) : super(VideoGetInitial());
  List<VideoModel> fetchVideos(String name, int id) {
    emit(VideoLoading());

    try {
      movie1repo.getVideos(name, id).then((videos11) {
        videos = videos11;
        emit(VideoLoaded(videos));
      });
    } catch (e) {
      emit(VideoError('Error happened in NowPlayingMovie'));
    }
    return videos;
  }
}
