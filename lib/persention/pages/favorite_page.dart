import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/localData/app_database.dart';

import '../../core/constants/app_string.dart';
import '../../data/models/details_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<DetailsModel> favoritlist = [];

  void fetchDetailsList() async {
    AppLocalStorge db = AppLocalStorge();

    List<DetailsModel> fetchlist = await db.getDetailsList();
    setState(() {
      favoritlist = fetchlist;
    });
  }

  void delete(int id) async {
    AppLocalStorge db = AppLocalStorge();
    setState(() {
      db.deleteDetailsToList(id);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDetailsList();
  }

  @override
  Widget build(BuildContext context) {
    int length = favoritlist.length;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Favorite 😍',
              style: TextStyle(color: whitecolor, fontSize: 20)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whitecolor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: generalcolor,
      ),
      backgroundColor: generalcolor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            favoritlist.isEmpty
                ? const SizedBox(
                    child: Center(
                      child: Text(
                        'No Favorite yet',
                        style: TextStyle(color: whitecolor),
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: ValueKey<int>(favoritlist[index].id!),
                            background: Container(
                              color: generalcolor,
                              child: const Icon(
                                Icons.delete,
                                color: whitecolor,
                              ),
                            ),
                            onDismissed: (direction) {
                              delete(favoritlist[index].id!);
                            },
                            child: singleSearchResult(favoritlist[index]));
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget singleSearchResult(DetailsModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            //sigmaX is the Horizontal blur
            sigmaX: 4.0,
            //sigmaY is the Vertical blur
            sigmaY: 4.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.13)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    //begin color
                    Colors.white.withOpacity(0.15),
                    //end color
                    Colors.white.withOpacity(0.05),
                  ]),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      onError: (exception, stackTrace) {
                        FadeInImage.assetNetwork(
                          placeholder:
                              'asset/lottie/Animation - 1710423869605.gif',
                          image:
                              'https://image.tmdb.org/t/p/w500${model.posterPath}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //I used this condition(model.mediaType! ) to fetch the title between the movie model because of the api
                      const SizedBox(
                        height: 5,
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.6,
                      //   child: Text(
                      //     model.originalName == 'null'
                      //         ? model.originalTitle!
                      //         : model.originalName!,
                      //     style: const TextStyle(color: whitecolor, fontSize: 18),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 5,
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          model.overview!,
                          maxLines: 4,
                          style:
                              const TextStyle(color: whitecolor, fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
