// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/movie_model.dart';
import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'similar_movie_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  List<MovieModel> similarmovie = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;

  SimilarCubit(this.movie1repo) : super(SimilarInitial());
  List<MovieModel> fetchSimilar(String name, int id, int page) {
    // print('from cubit 1 ${movie1repo.getpopularMovie()}');
    emit(SimilarLoading());
    try {
      movie1repo.getsimilar(name, id, page).then((similar11movie) {
        similarmovie = similar11movie;
        emit(SimilarLoaded(similarmovie));

        // print('from cubit2 $similarmovie');
      });
    } catch (e) {
      emit(SimilarError('Error happened in PopularMovies'));
    }
    return similarmovie;
  }
}
