// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussnic_logic/cubit/popularTv/cubit/popular_tv_cubit.dart';
import '../../../core/constants/app_string.dart';
import '../../../data/models/movie_model.dart';
import '../../widgets/slider_single_item.dart';

class PopularTvBlocBuilder extends StatefulWidget {
  const PopularTvBlocBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularTvBlocBuilder> createState() => _PopularTvBlocBuilderState();
}

class _PopularTvBlocBuilderState extends State<PopularTvBlocBuilder> {
  late List<MovieModel> popularTvlist;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularTvCubit, PopularTvState>(
      builder: (context, state) {
        if (state is PopularTvLoaded) {
          popularTvlist = (state).movies;
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
                itemCount: popularTvlist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleItem(
                      id: popularTvlist[index].id!,
                      type: 'tv',
                      model: popularTvlist[index],
                    ),
                  );
                }),
          );
        } else if (state is PopularTvLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: whitecolor,
            ),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                popularTvlist = BlocProvider.of<PopularTvCubit>(context)
                    .fetchPopularTV('tv', 1);
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
