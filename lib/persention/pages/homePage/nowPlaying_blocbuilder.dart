// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussnic_logic/cubit/nowPlayingMovie/cubit/now_playing_movie_cubit.dart';
import '../../../core/constants/app_string.dart';
import '../../../data/models/movie_model.dart';
import '../../widgets/slider_single_item.dart';

class NowPlayingBlocBuilder extends StatefulWidget {
  const NowPlayingBlocBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<NowPlayingBlocBuilder> createState() => _NowPlayingBlocBuilderState();
}

class _NowPlayingBlocBuilderState extends State<NowPlayingBlocBuilder>
    with SingleTickerProviderStateMixin {
  late List<MovieModel> nowplayingmoivelist;
  int page = 1;
  @override
  void initState() {
    super.initState();
    nowplayingmoivelist = BlocProvider.of<NowPlayingMovieCubit>(context)
        .fetchNowplyingmovie(page);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
      builder: (context, state) {
        if (state is NowPlayingMovieLoaded) {
          nowplayingmoivelist = (state).movies;
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: nowplayingmoivelist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleItem(
                  id: nowplayingmoivelist[index].id!,
                  type: 'movie',
                  model: nowplayingmoivelist[index],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 1,
              childAspectRatio: 4 / 3,
            ),
          );
        } else if (state is NowPlayingMovieLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: whitecolor,
            ),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                nowplayingmoivelist =
                    BlocProvider.of<NowPlayingMovieCubit>(context)
                        .fetchNowplyingmovie(1);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Try Again",
                  style: TextStyle(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
