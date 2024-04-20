part of 'similar_movie_cubit.dart';

@immutable
sealed class SimilarState {}

final class SimilarInitial extends SimilarState {}

class SimilarLoading extends SimilarState {}

class SimilarLoaded extends SimilarState {
  final List<MovieModel> movies;

  SimilarLoaded(this.movies);
}

class SimilarError extends SimilarState {
  final String message;

  SimilarError(this.message);
}
