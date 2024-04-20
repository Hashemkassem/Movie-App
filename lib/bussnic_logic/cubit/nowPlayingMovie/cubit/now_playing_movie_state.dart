part of 'now_playing_movie_cubit.dart';

@immutable
sealed class NowPlayingMovieState {}

final class NowPlayingMovieInitial extends NowPlayingMovieState {}

class NowPlayingMovieLoading extends NowPlayingMovieState {}

class NowPlayingMovieLoaded extends NowPlayingMovieState {
  final List<MovieModel> movies;

  NowPlayingMovieLoaded(this.movies);
}

class NowPlayingMovieError extends NowPlayingMovieState {
  final String message;

  NowPlayingMovieError(this.message);
}
