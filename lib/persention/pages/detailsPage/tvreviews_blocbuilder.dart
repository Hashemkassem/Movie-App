// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/core/constants/app_string.dart';

import '../../../bussnic_logic/cubit/reviews/cubit/reviews_cubit.dart';
import '../../../data/models/reviews_model.dart';

class ReviewsBlocBuilder extends StatelessWidget {
  final int id;
  List<ReviewsModel> reviewslist;
  final String type;
  ReviewsBlocBuilder({
    Key? key,
    required this.id,
    required this.reviewslist,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        if (state is ReviewsLoaded) {
          reviewslist = (state).reviews;
          return reviewslist.isEmpty
              ? const Center(
                  child: Text(
                    'No Reviews 😢',
                    style: TextStyle(color: whitecolor),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  // width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: reviewslist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.27,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: whitecolor,
                              ),
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: SingleChildScrollView(
                              physics: const ClampingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: maincolor,
                                          child: Icon(
                                            Icons.person,
                                            color: whitecolor,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          reviewslist[index]
                                              .author!
                                              .toUpperCase(),
                                          style:
                                              const TextStyle(color: maincolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        reviewslist[index].content!,
                                        // maxLines: 8,
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                          color: whitecolor,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        } else if (state is ReviewsLoading) {
          return Center(
            child: Image.asset('asset/lottie/Animation - 1710423869605.gif'),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                reviewslist = BlocProvider.of<ReviewsCubit>(context)
                    .fetchMovieReviewsmovie(type, id);
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
