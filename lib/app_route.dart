// ignore_for_file: public_member_api_docs, sort_constructors_first, body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bussnic_logic/cubit/cubit/search_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/details/cubit/details_cubit.dart';

import 'package:movie_app/bussnic_logic/cubit/nowPlayingMovie/cubit/now_playing_movie_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/onTheAirTv/cubit/on_the_air_tv_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/popularMovie/cubit/popular_movie_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/popularTv/cubit/popular_tv_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/reviews/cubit/reviews_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/similaMovie/cubit/similar_movie_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/topRatedMovie/cubit/top_rated_movie_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/topRatedTv/cubit/top_rated_tv_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/upcomingMovie/cubit/up_coming_movie_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/video/cubit/video_get_cubit.dart';
import 'package:movie_app/core/constants/app_string.dart';
import 'package:movie_app/data/repo/movie_repo.dart';
import 'package:movie_app/data/webservecs/MovieApiRespons_webservecs.dart';
import 'package:movie_app/persention/pages/detailsPage/details_page.dart';
import 'package:movie_app/persention/pages/favorite_page.dart';
import 'package:movie_app/persention/pages/homePage/home_page.dart';
import 'package:movie_app/persention/pages/search_page.dart';

class AppRoute {
  /*we create this parameter for two reasone:
   1- clean code
   2- to access the cubit for all the screen 
   3- in this way we create only one cubit (because in another way we will create a new cubit in each time
   */
  late TVandMovie1Repo movie1repo;
  // late MovieCubit movieCubit;

  AppRoute() {
    movie1repo = TVandMovie1Repo(TVandMovieWebServecs());
    // movieCubit = MovieCubit(movie1repo);
  }

  Route? generateRout(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<SearchCubit>(
                      create: (context) => SearchCubit(movie1repo),
                    ),
                    BlocProvider<PopularMovieCubit>(
                      create: (context) => PopularMovieCubit(movie1repo),
                    ),
                    BlocProvider<PopularTvCubit>(
                      create: (context) => PopularTvCubit(movie1repo),
                    ),
                    BlocProvider<UpComingMovieCubit>(
                      create: (context) => UpComingMovieCubit(movie1repo),
                    ),
                    BlocProvider<TopRatedMovieCubit>(
                      create: (context) => TopRatedMovieCubit(movie1repo),
                    ),
                    BlocProvider<NowPlayingMovieCubit>(
                      create: (context) => NowPlayingMovieCubit(movie1repo),
                    ),
                    BlocProvider<TopRatedTvCubit>(
                      create: (context) => TopRatedTvCubit(movie1repo),
                    ),
                    BlocProvider<OnTheAirTvCubit>(
                      create: (context) => OnTheAirTvCubit(movie1repo),
                    ),
                  ],
                  child: const HomePage(),
                ));
      case details:
        final detail = settings.arguments as DetailsPage;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SimilarCubit(movie1repo),
              ),
              BlocProvider(
                create: (context) => VideoGetCubit(movie1repo),
              ),
              BlocProvider(
                create: (context) => ReviewsCubit(movie1repo),
              ),
              BlocProvider(
                create: (context) => DetailsCubit(movie1repo),
              ),
            ],
            child: DetailsPage(
              id: detail.id,
              type: detail.type,
            ),
          ),
        );
      case searchpage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SearchCubit(movie1repo),
              ),
            ],
            child: const SearchPage(),
          ),
        );
      case favoritepage:
        return MaterialPageRoute(
          builder: (_) => const FavoritePage(),
        );
    }
  }
}
