part of 'up_coming_movie_cubit.dart';

@immutable
sealed class UpComingMovieState {}

final class UpComingMovieInitial extends UpComingMovieState {}

class UpComingMovieLoading extends UpComingMovieState {}

class UpComingMovieLoaded extends UpComingMovieState {
  final List<MovieModel> movies;

  UpComingMovieLoaded(this.movies);
}

class UpComingMovieError extends UpComingMovieState {
  final String message;

  UpComingMovieError(this.message);
}
