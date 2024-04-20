import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/core/constants/app_string.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/persention/pages/detailsPage/details_page.dart';

class SingleItem extends StatelessWidget {
  final int id;
  final MovieModel model;
  final String type;

  const SingleItem({
    Key? key,
    required this.id,
    required this.type,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            details,
            arguments: DetailsPage(
              id: id,
              type: type,
            ),
          );
        },
        child: Hero(
          tag: id,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.24,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
              onError: (exception, stackTrace) {
                FadeInImage.assetNetwork(
                  placeholder: 'asset/lottie/Animation - 1710423869605.gif',
                  image: 'https://image.tmdb.org/t/p/w500${model.posterPath}',
                );
              },
              colorFilter: ColorFilter.mode(
                  generalcolor.withOpacity(0.3), BlendMode.darken),
              fit: BoxFit.fill,
              image: CachedNetworkImageProvider(
                'https://image.tmdb.org/t/p/w500${model.posterPath}',
              ),
            )),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4, top: 4),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        width: 75,
                        decoration: BoxDecoration(
                            color: generalcolor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //rating icon
                            const Icon(Icons.star,
                                color: Colors.amber, size: 20),
                            const SizedBox(width: 10),
                            Text(
                              '${model.voteAverage}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
