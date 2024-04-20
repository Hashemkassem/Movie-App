// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussnic_logic/cubit/nowPlayingMovie/cubit/now_playing_movie_cubit.dart';
import '../../../bussnic_logic/cubit/onTheAirTv/cubit/on_the_air_tv_cubit.dart';
import '../../../core/constants/app_string.dart';
import '../../../data/models/movie_model.dart';
import '../../widgets/slider_single_item.dart';

class OnTheAirTvBlocBuilder extends StatefulWidget {
  const OnTheAirTvBlocBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<OnTheAirTvBlocBuilder> createState() => _OnTheAirTvBlocBuilderState();
}

class _OnTheAirTvBlocBuilderState extends State<OnTheAirTvBlocBuilder>
    with SingleTickerProviderStateMixin {
  late List<MovieModel> onTheAirTvlist;
  int page = 1;
  @override
  void initState() {
    super.initState();
    onTheAirTvlist =
        BlocProvider.of<OnTheAirTvCubit>(context).fetchonTheAirTvTV(page);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnTheAirTvCubit, OnTheAirTvState>(
      builder: (context, state) {
        if (state is OnTheAirTvLoaded) {
          onTheAirTvlist = (state).movies;
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: onTheAirTvlist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleItem(
                  id: onTheAirTvlist[index].id!,
                  type: 'tv',
                  model: onTheAirTvlist[index],
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
                onTheAirTvlist = BlocProvider.of<OnTheAirTvCubit>(context)
                    .fetchonTheAirTvTV(1);
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
