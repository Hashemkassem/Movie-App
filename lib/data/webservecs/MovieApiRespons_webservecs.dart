// ignore_for_file: avoid_print, file_names

import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/app_string.dart';

class TVandMovieWebServecs {
  late Dio dio;
  TVandMovieWebServecs() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: BASE_URL,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getPopular(String name, int page) async {
    print("=================object web of getpopularMovie ");
    // List<MovieModel> jsonList = response.data['results'];
    try {
      Response response =
          await dio.get('$name/popular?api_key=$API_KEY&page=$page');

      print('from web services ======================');

      return response.data['results'];
    } catch (e) {
      print("=================object error of getpopularMovie ");
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getTopRated(String name, int page) async {
    try {
      Response response =
          await dio.get('$name/top_rated?api_key=$API_KEY&page=$page');

      // print(response.data['results'].toString());

      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getUpComingMovie(int page) async {
    try {
      Response response =
          await dio.get('movie/upcoming?api_key=$API_KEY&page=$page');

      // print(response.data['results'].toString());

      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getNowPlayingMovie(int page) async {
    try {
      Response response =
          await dio.get('movie/now_playing?api_key=$API_KEY&page=$page');

      // print(response.data['results'].toString());

      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getOnAirTV(int page) async {
    try {
      Response response =
          await dio.get('tv/on_the_air?api_key=$API_KEY&page=$page');
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  ///===========================================
  Future<dynamic> getDetails(String name, int id) async {
    try {
      Response response = await dio.get('$name/$id?api_key=$API_KEY');
      // print('===============get geners ${response.data.toString()}');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  ///===========================================
  Future<List<dynamic>> getSimilar(String name, int id, int page) async {
    try {
      Response response =
          await dio.get('$name/$id/similar?api_key=$API_KEY&page=$page');
      // print(
      //     '===============get similar movie ${response.data['results'].toString()}');
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getSearch(String query, int page) async {
    try {
      Response response = await dio
          .get('search/multi?api_key=$API_KEY&query=$query&page=$page');
      // print(
      //     '===============get similar movie ${response.data['results'].toString()}');
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getReviews(String name, int id) async {
    try {
      Response response = await dio.get('$name/$id/reviews?api_key=$API_KEY');
      // print(
      //     '===============get MovieReviews ${response.data['results'].toString()}');
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getVideo(String name, int id) async {
    try {
      Response response = await dio.get('$name/$id/videos?api_key=$API_KEY');
      // print(
      //     '===============get MovieVideos ${response.data['results'].toString()}');
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
