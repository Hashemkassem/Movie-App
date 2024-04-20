part of 'top_rated_tv_cubit.dart';

@immutable
sealed class TopRatedTvState {}

final class TopRatedTvInitial extends TopRatedTvState {}

class TopRatedTvLoading extends TopRatedTvState {}

class TopRatedTvLoaded extends TopRatedTvState {
  final List<MovieModel> movies;

  TopRatedTvLoaded(this.movies);
}

class TopRatedTvError extends TopRatedTvState {
  final String message;

  TopRatedTvError(this.message);
}
