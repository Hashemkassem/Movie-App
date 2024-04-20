// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/data/models/movie_model.dart';

import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  List<MovieModel> popularmovie = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;
  PopularMovieCubit(
    this.movie1repo,
  ) : super(PopularMovieInitial());
  List<MovieModel> fetchPopularmovie(String name, int page) {
    // print('from cubit 1 ${movie1repo.getpopularMovie()}');
    emit(PopularMoviesLoading());
    try {
      movie1repo.getpopular(name, page).then((popular11movie) {
        popularmovie = popular11movie;
        emit(PopularMoviesLoaded(popularmovie));

        // print('from cubit2 $popularmovie');
      });
    } catch (e) {
      emit(PopularMoviesError('Error happened in PopularMovies'));
    }
    return popularmovie;
  }
}
