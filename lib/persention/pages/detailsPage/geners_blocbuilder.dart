// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussnic_logic/cubit/details/cubit/details_cubit.dart';
import '../../../core/constants/app_string.dart';
import '../../../data/models/details_model.dart';

class GenresBlocBuilder extends StatelessWidget {
  late DetailsModel details11;
  late int id;
  GenresBlocBuilder({
    Key? key,
    required this.id,
    required this.details11,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsLoaded) {
          details11 = (state).details;
          return SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: details11.genres!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    // width: 120,
                    decoration: BoxDecoration(
                        color: maincolor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(details11.genres![index].name!,
                          style: const TextStyle(color: whitecolor)),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is DetailsLoading) {
          return Center(
            child: Image.asset('asset/lottie/Animation - 1710423869605.gif'),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                // generslist =
                //     BlocProvider.of<GenersCubit>(context).fetchMovieGeners(,id);
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
