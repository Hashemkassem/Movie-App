// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussnic_logic/cubit/topRatedMovie/cubit/top_rated_movie_cubit.dart';
import '../../../data/models/movie_model.dart';
import '../../widgets/slider_single_item.dart';

class TopRatedBlocBuilder extends StatefulWidget {
  const TopRatedBlocBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<TopRatedBlocBuilder> createState() => _TopRatedBlocBuilderState();
}

class _TopRatedBlocBuilderState extends State<TopRatedBlocBuilder>
    with SingleTickerProviderStateMixin {
  late List<MovieModel> topRatedmoivelist;
  ScrollController scrollController = ScrollController();
  int page = 1;
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          topRatedmoivelist = topRatedmoivelist +
              BlocProvider.of<TopRatedMovieCubit>(context)
                  .fetchTopratedMovie('movie', page++);
        });
      }
    });
  }

  int maxline = 20;
  bool isloading = false;
  bool hasmore = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMovieCubit, TopRatedMovieState>(
      builder: (context, state) {
        if (state is TopRatedMovieLoaded) {
          topRatedmoivelist = (state).movies;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                controller: scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 1,
                  childAspectRatio: 5 / 4,
                ),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: topRatedmoivelist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleItem(
                      id: topRatedmoivelist[index].id!,
                      type: 'movie',
                      model: topRatedmoivelist[index],
                    ),
                  );
                }),
          );
        } else if (state is TopRatedMovieLoading) {
          return Center(
            child: Image.asset('asset/lottie/Animation - 1710423869605.gif'),
          );
        } else {
          return Center(
              // padding: EdgeInsets.all(8.0),
              child: Image.asset('asset/lottie/Animation - 1710423869605.gif'));
        }
      },
    );
  }
}
