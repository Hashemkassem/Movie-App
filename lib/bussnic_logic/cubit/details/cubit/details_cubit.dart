// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/details_model.dart';

import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final TVandMovie1Repo movie1repo;
  late DetailsModel moviedetails = DetailsModel();
  late TVandMovieWebServecs movieWebServecs;
  DetailsCubit(
    this.movie1repo,
  ) : super(DetailsInitial());
  DetailsModel fetchDetails(String name, int id) {
    emit(DetailsLoading());

    try {
      movie1repo.getdetails(name, id).then((moviedetails11) {
        emit(DetailsLoaded(moviedetails11));
        moviedetails = moviedetails11;

        print(
            'from cubit ${name == 'tv' ? moviedetails.originalName : moviedetails.title}');
      });
    } catch (e) {
      emit(DetailsError('Error happened in NowPlayingMovie'));
    }
    return moviedetails;
  }
}
