// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussnic_logic/cubit/topRatedMovie/cubit/top_rated_movie_cubit.dart';
import '../../../bussnic_logic/cubit/topRatedTv/cubit/top_rated_tv_cubit.dart';
import '../../../data/models/movie_model.dart';
import '../../../core/constants/app_string.dart';
import '../../widgets/slider_single_item.dart';

class TopRatedTvBlocBuild extends StatefulWidget {
  const TopRatedTvBlocBuild({
    Key? key,
  }) : super(key: key);

  @override
  State<TopRatedTvBlocBuild> createState() => _TopRatedTvBlocBuildState();
}

class _TopRatedTvBlocBuildState extends State<TopRatedTvBlocBuild>
    with SingleTickerProviderStateMixin {
  late List<MovieModel> topRatedTvlist;
  int page = 1;
  @override
  void initState() {
    super.initState();
    topRatedTvlist =
        BlocProvider.of<TopRatedTvCubit>(context).fetchTopratedTV('tv', page);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedTvCubit, TopRatedTvState>(
      builder: (context, state) {
        if (state is TopRatedTvLoaded) {
          topRatedTvlist = (state).movies;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 1,
                  childAspectRatio: 4 / 3,
                ),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: topRatedTvlist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleItem(
                      id: topRatedTvlist[index].id!,
                      type: 'tv',
                      model: topRatedTvlist[index],
                    ),
                  );
                }),
          );
        } else if (state is TopRatedMovieLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: whitecolor,
            ),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                topRatedTvlist = BlocProvider.of<TopRatedTvCubit>(context)
                    .fetchTopratedTV('tv', page);
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
