import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/movie_model.dart';

import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'top_rated_tv_state.dart';

class TopRatedTvCubit extends Cubit<TopRatedTvState> {
  List<MovieModel> topratedTv = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;
  TopRatedTvCubit(this.movie1repo) : super(TopRatedTvInitial());
  List<MovieModel> fetchTopratedTV(String name, int page) {
    emit(TopRatedTvLoading());
    try {
      movie1repo.gettopRated(name, page).then((toprated11tv) {
        emit(TopRatedTvLoaded(toprated11tv));
        topratedTv = toprated11tv;
      });
    } catch (e) {
      emit(TopRatedTvError('error happend in TopRatedTvError'));
    }

    return topratedTv;
  }
}
