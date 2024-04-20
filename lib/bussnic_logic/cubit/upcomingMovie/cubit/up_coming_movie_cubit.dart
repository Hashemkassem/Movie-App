import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/movie_model.dart';

import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'up_coming_movie_state.dart';

class UpComingMovieCubit extends Cubit<UpComingMovieState> {
  List<MovieModel> upcomingmovie = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;
  UpComingMovieCubit(this.movie1repo) : super(UpComingMovieInitial());

  List<MovieModel> fetchUpcomingmovie(int page) {
    movie1repo.getupcomingMovie(page).then((upcoming11movie) {
      emit(UpComingMovieLoading());
      try {
        emit(UpComingMovieLoaded(upcoming11movie));
        upcomingmovie = upcoming11movie;
      } catch (e) {
        emit(UpComingMovieError('Error happened in UpComingMovieError'));
      }
    });
    return upcomingmovie;
  }
}
