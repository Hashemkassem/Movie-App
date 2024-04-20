part of 'popular_tv_cubit.dart';

@immutable
sealed class PopularTvState {}

final class PopularTvInitial extends PopularTvState {}

class PopularTvLoading extends PopularTvState {}

class PopularTvLoaded extends PopularTvState {
  final List<MovieModel> movies;

  PopularTvLoaded(this.movies);
}

class PopularTvError extends PopularTvState {
  final String message;

  PopularTvError(this.message);
}
