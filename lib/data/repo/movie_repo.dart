// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:movie_app/data/models/details_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/videos_model.dart';

import '../models/reviews_model.dart';
import '../webservecs/MovieApiRespons_webservecs.dart';

class TVandMovie1Repo {
  final TVandMovieWebServecs tVandMovieWebServecs;

  TVandMovie1Repo(
    this.tVandMovieWebServecs,
  );

  Future<List<MovieModel>> getpopular(String name, int page) async {
    print("=================object repo of getpopularMovie ");
    final popularMovie = await tVandMovieWebServecs.getPopular(name, page);
    return popularMovie
        .map((objectmovie) => MovieModel.fromJson(objectmovie))
        .toList();
  }

  Future<List<MovieModel>> gettopRated(String name, int page) async {
    final topRatedMovie = await tVandMovieWebServecs.getTopRated(name, page);
    print("=================object repo of gettopRatedMovie ");
    return topRatedMovie
        .map((objectmovie) => MovieModel.fromJson(objectmovie))
        .toList();
  }

  Future<List<MovieModel>> getnowPlayingMovie(int page) async {
    print("=================object repo of getnowPlayingMovie ");
    final nowPlayingMovie = await tVandMovieWebServecs.getNowPlayingMovie(page);
    return nowPlayingMovie
        .map((objectmovie) => MovieModel.fromJson(objectmovie))
        .toList();
  }

  Future<List<MovieModel>> getupcomingMovie(int page) async {
    print("=================object repo of getupcomingMovie ");
    final upcomingMovie = await tVandMovieWebServecs.getUpComingMovie(page);
    return upcomingMovie
        .map((objectmovie) => MovieModel.fromJson(objectmovie))
        .toList();
  }

  Future<List<MovieModel>> getonTheAirTv(int page) async {
    print("=================object repo of getonTheAirTv");
    final onTheAirTv = await tVandMovieWebServecs.getOnAirTV(page);
    return onTheAirTv.map((objectv) => MovieModel.fromJson(objectv)).toList();
  }
  //============================================

  Future<DetailsModel> getdetails(String name, int id) async {
    print("=================object repo of getgeners");
    var generslist = await tVandMovieWebServecs.getDetails(name, id);
    print('from detrepo${DetailsModel.fromJson(generslist).budget}');
    return DetailsModel.fromJson(generslist);
  }

  Future<List<MovieModel>> getsimilar(String name, int id, int page) async {
    print("=================object repo of getsimilarMovie");
    final similarMovie = await tVandMovieWebServecs.getSimilar(name, id, page);
    return similarMovie.map((objec) => MovieModel.fromJson(objec)).toList();
  }

  Future<List<MovieModel>> getSearch(String query, int page) async {
    print("=================object repo of getsimilarMovie");
    final similarMovie = await tVandMovieWebServecs.getSearch(query, page);
    return similarMovie.map((objec) => MovieModel.fromJson(objec)).toList();
  }

  Future<List<ReviewsModel>> getReviews(String name, int id) async {
    print("=================object repo of getReviews");
    final movieReviews = await tVandMovieWebServecs.getReviews(name, id);
    return movieReviews.map((objec) => ReviewsModel.fromJson(objec)).toList();
  }

  Future<List<VideoModel>> getVideos(String name, int id) async {
    print("=================object repo of getVideos");
    final video = await tVandMovieWebServecs.getVideo(name, id);
    return video.map((objec) => VideoModel.fromJson(objec)).toList();
  }
}
