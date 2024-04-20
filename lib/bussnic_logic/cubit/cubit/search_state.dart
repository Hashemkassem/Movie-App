part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieModel> search;

  SearchLoaded(this.search);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
