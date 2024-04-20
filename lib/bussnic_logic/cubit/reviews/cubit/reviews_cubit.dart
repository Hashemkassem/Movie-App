import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/reviews_model.dart';

import '../../../../data/repo/movie_repo.dart';
import '../../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  List<ReviewsModel> reviews = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;
  ReviewsCubit(this.movie1repo) : super(ReviewsInitial());
  List<ReviewsModel> fetchMovieReviewsmovie(String name, int id) {
    emit(ReviewsLoading());

    try {
      movie1repo.getReviews(name, id).then((reviews11) {
        reviews = reviews11;
        emit(ReviewsLoaded(reviews11));
      });
    } catch (e) {
      emit(ReviewsError('Error happened in MovieReviews'));
    }
    return reviews;
  }
}
