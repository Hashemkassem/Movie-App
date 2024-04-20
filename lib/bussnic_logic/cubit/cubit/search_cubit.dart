import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/movie_model.dart';

import '../../../data/repo/movie_repo.dart';
import '../../../data/webservecs/MovieApiRespons_webservecs.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.movie1repo) : super(SearchInitial());
  List<MovieModel> searchList = [];
  final TVandMovie1Repo movie1repo;
  late TVandMovieWebServecs movieWebServecs;

  List<MovieModel> fetchsearchList(String query, int page) {
    emit(SearchLoading());

    try {
      movie1repo.getSearch(query, page).then((searchList11) {
        searchList = searchList11;
        emit(SearchLoaded(searchList11));
      });
    } catch (e) {
      emit(SearchError('Error happened in Search'));
    }
    return searchList;
  }
}
