import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/movie_model.dart';

import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'now_playing_movie_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  List<MovieModel> nowplayingmovie = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;
  NowPlayingMovieCubit(this.movie1repo) : super(NowPlayingMovieInitial());
  List<MovieModel> fetchNowplyingmovie(int page) {
    emit(NowPlayingMovieLoading());

    try {
      movie1repo.getnowPlayingMovie(page).then((nowplaying11movie) {
        nowplayingmovie = nowplaying11movie;
        emit(NowPlayingMovieLoaded(nowplaying11movie));
      });
    } catch (e) {
      emit(NowPlayingMovieError('Error happened in NowPlayingMovie'));
    }
    return nowplayingmovie;
  }
}
