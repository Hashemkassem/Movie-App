import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/movie_model.dart';
import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'on_the_air_tv_state.dart';

class OnTheAirTvCubit extends Cubit<OnTheAirTvState> {
  List<MovieModel> onTheAirTv = [];

  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;
  OnTheAirTvCubit(this.movie1repo) : super(OnTheAirTvInitial());
  List<MovieModel> fetchonTheAirTvTV(int page) {
    emit(OnTheAirTvLoading());
    try {
      movie1repo.getonTheAirTv(page).then((onTheAir11Tv) {
        emit(OnTheAirTvLoaded(onTheAir11Tv));
        onTheAirTv = onTheAir11Tv;
      });
    } catch (e) {
      emit(OnTheAirTvError('Error happend in OnTheAirTvErrors'));
    }

    return onTheAirTv;
  }
}
