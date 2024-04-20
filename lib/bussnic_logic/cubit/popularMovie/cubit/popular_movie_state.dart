part of 'popular_movie_cubit.dart';

@immutable
sealed class PopularMovieState {}

final class PopularMovieInitial extends PopularMovieState {}

class PopularMoviesLoading extends PopularMovieState {}

class PopularMoviesLoaded extends PopularMovieState {
  final List<MovieModel> movies;

  PopularMoviesLoaded(this.movies);
}

class PopularMoviesError extends PopularMovieState {
  final String message;

  PopularMoviesError(this.message);
}
