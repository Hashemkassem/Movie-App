part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final List<ReviewsModel> reviews;

  ReviewsLoaded(this.reviews);
}

class ReviewsError extends ReviewsState {
  final String message;

  ReviewsError(this.message);
}
