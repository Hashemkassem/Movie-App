part of 'on_the_air_tv_cubit.dart';

@immutable
sealed class OnTheAirTvState {}

final class OnTheAirTvInitial extends OnTheAirTvState {}

class OnTheAirTvLoading extends OnTheAirTvState {}

class OnTheAirTvLoaded extends OnTheAirTvState {
  final List<MovieModel> movies;

  OnTheAirTvLoaded(this.movies);
}

class OnTheAirTvError extends OnTheAirTvState {
  final String message;

  OnTheAirTvError(this.message);
}
