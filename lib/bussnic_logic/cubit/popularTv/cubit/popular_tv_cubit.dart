import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/movie_model.dart';
import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  List<MovieModel> popularTv = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;
  PopularTvCubit(this.movie1repo) : super(PopularTvInitial());
  List<MovieModel> fetchPopularTV(String name, int page) {
    emit(PopularTvLoading());
    try {
      movie1repo.getpopular(name, page).then((popular11movie) {
        emit(PopularTvLoaded(popular11movie));
        popularTv = popular11movie;
      });
    } catch (e) {
      emit(PopularTvError('Error happend in PopularTvError'));
    }

    return popularTv;
  }
}
