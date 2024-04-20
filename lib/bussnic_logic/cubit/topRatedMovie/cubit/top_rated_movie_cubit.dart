import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/movie_model.dart';
import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'top_rated_movie_state.dart';

class TopRatedMovieCubit extends Cubit<TopRatedMovieState> {
  List<MovieModel> topratedmovie = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;
  TopRatedMovieCubit(this.movie1repo) : super(TopRatedMovieInitial());

  List<MovieModel> fetchTopratedMovie(String name, int page) {
    emit(TopRatedMovieLoading());
    try {
      movie1repo.gettopRated(name, page).then((toprated11tv) {
        emit(TopRatedMovieLoaded(toprated11tv));
        topratedmovie = toprated11tv;
      });
    } catch (e) {
      emit(TopRatedMovieError('error happend in TopRatedTvError'));
    }

    return topratedmovie;
  }
}
