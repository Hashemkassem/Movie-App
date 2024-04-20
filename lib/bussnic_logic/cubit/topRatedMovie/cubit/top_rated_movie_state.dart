part of 'top_rated_movie_cubit.dart';

@immutable
sealed class TopRatedMovieState {}

final class TopRatedMovieInitial extends TopRatedMovieState {}

class TopRatedMovieLoading extends TopRatedMovieState {}

class TopRatedMovieLoaded extends TopRatedMovieState {
  final List<MovieModel> movies;

  TopRatedMovieLoaded(this.movies);
}

class TopRatedMovieError extends TopRatedMovieState {
  final String message;

  TopRatedMovieError(this.message);
}
