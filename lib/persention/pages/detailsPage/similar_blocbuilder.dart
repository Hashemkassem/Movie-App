// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/app_string.dart';
import 'package:movie_app/data/models/details_model.dart';
// import 'package:movie_app/core/constants/app_string.dart';

import '../../../bussnic_logic/cubit/similaMovie/cubit/similar_movie_cubit.dart';

import '../../../data/models/movie_model.dart';
import '../../widgets/similar_item.dart';

class SimilarBlocBuilder extends StatelessWidget {
  final int id;
  late List<MovieModel> similarlist;
  final String type;
  final DetailsModel model;
  SimilarBlocBuilder({
    Key? key,
    required this.id,
    required this.similarlist,
    required this.type,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarCubit, SimilarState>(
      builder: (context, state) {
        if (state is SimilarLoaded) {
          similarlist = (state).movies;
          return similarlist.isEmpty
              ? const Center(
                  child: Text(
                    'No Similar  😢',
                    style: TextStyle(color: whitecolor),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: similarlist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SimilarSingleItem(
                                type: type,
                                id: similarlist[index].id!,
                                model: similarlist[index],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        } else if (state is SimilarError) {
          return Center(
            child: Image.asset('asset/lottie/Animation - 1710423869605.gif'),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                similarlist = BlocProvider.of<SimilarCubit>(context)
                    .fetchSimilar(type, id, 1);
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
    // } else {
    //   return BlocBuilder<SimilarCubit, SimilarState>(
    //     builder: (context, state) {
    //       if (state is SimilarLoaded) {
    //         similarmovielist = (state).movies;
    //         return SizedBox(
    //           height: MediaQuery.of(context).size.height * 0.31,
    //           width: 200,
    //           child: ListView.builder(
    //             scrollDirection: Axis.horizontal,
    //             itemCount: similarmovielist.length,
    //             itemBuilder: (context, index) {
    //               return Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: SingleChildScrollView(
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       SingleItem(
    //                         type: 'movie',
    //                         id: similarmovielist[index].id!,
    //                       ),
    //                       const SizedBox(
    //                         height: 20,
    //                       ),
    //                       SizedBox(
    //                         width: 150,
    //                         child: Text(
    //                           similarmovielist[index].title.toString(),
    //                           maxLines: 2,
    //                           overflow: TextOverflow.ellipsis,
    //                           style: const TextStyle(
    //                             color: whitecolor,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //         );
    //       } else if (state is SimilarError) {
    //         return Center(
    //           child: Image.asset('asset/lottie/Animation - 1710423869605.gif'),
    //         );
    //       } else {
    //         return Center(
    //           child: ElevatedButton(
    //             onPressed: () {
    //               similarmovielist = BlocProvider.of<SimilarCubit>(context)
    //                   .fetchSimilar('movie', id,1);
    //             },
    //             child: const Padding(
    //               padding: EdgeInsets.all(8.0),
    //               child: Text(
    //                 "Try Again",
    //                 style: TextStyle(),
    //               ),
    //             ),
    //           ),
    //         );
    //       }
    //     },
    //   );
    // }
  }
}
