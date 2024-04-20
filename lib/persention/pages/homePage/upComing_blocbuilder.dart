// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussnic_logic/cubit/upcomingMovie/cubit/up_coming_movie_cubit.dart';
import '../../../core/constants/app_string.dart';
import '../../../data/models/movie_model.dart';
import '../../widgets/slider_single_item.dart';

class UpComingBlocBuilder extends StatefulWidget {
  const UpComingBlocBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<UpComingBlocBuilder> createState() => _UpComingBlocBuilderState();
}

class _UpComingBlocBuilderState extends State<UpComingBlocBuilder>
    with SingleTickerProviderStateMixin {
  int page = 1;

  late List<MovieModel> upComingmoivelist;
  @override
  void initState() {
    super.initState();
    upComingmoivelist =
        BlocProvider.of<UpComingMovieCubit>(context).fetchUpcomingmovie(page);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpComingMovieCubit, UpComingMovieState>(
      builder: (context, state) {
        if (state is UpComingMovieLoaded) {
          upComingmoivelist = (state).movies;
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
                itemCount: upComingmoivelist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleItem(
                      id: upComingmoivelist[index].id!,
                      type: 'movie',
                      model: upComingmoivelist[index],
                    ),
                  );
                }),
          );
        } else if (state is UpComingMovieLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: whitecolor,
            ),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                upComingmoivelist = BlocProvider.of<UpComingMovieCubit>(context)
                    .fetchUpcomingmovie(1);
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
