// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, unnecessary_brace_in_string_interps, unrelated_type_equality_checks, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:movie_app/bussnic_logic/cubit/similaMovie/cubit/similar_movie_cubit.dart';
import 'package:movie_app/bussnic_logic/cubit/video/cubit/video_get_cubit.dart';
import 'package:movie_app/core/constants/app_string.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/videos_model.dart';
import 'package:movie_app/persention/pages/detailsPage/similar_blocbuilder.dart';
import 'package:movie_app/persention/pages/detailsPage/tvreviews_blocbuilder.dart';

import '../../../bussnic_logic/cubit/details/cubit/details_cubit.dart';
import '../../../bussnic_logic/cubit/reviews/cubit/reviews_cubit.dart';
import '../../../data/localData/app_database.dart';
import '../../../data/models/details_model.dart';
import '../../../data/models/reviews_model.dart';

class DetailsPage extends StatefulWidget {
  final int id;
  final String type;
  // final DetailsModel details22;
  const DetailsPage({
    Key? key,
    required this.id,
    required this.type,
    // required this.details22,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late DetailsModel moviedetails;
  late List<MovieModel> similarlist;
  late List<VideoModel> videolist;
  late List<ReviewsModel> reviewlist;
  bool isVisible = true;
  final formkey = GlobalKey<FormBuilderState>();
  Map<String, dynamic>? get formData => formkey.currentState?.value;
  // final isDone = useState<bool?>(false);
  // final isloading = useState<bool?>(false);
  @override
  void initState() {
    super.initState();
    moviedetails = BlocProvider.of<DetailsCubit>(context)
        .fetchDetails(widget.type, widget.id);
    similarlist = BlocProvider.of<SimilarCubit>(context)
        .fetchSimilar(widget.type, widget.id, 1);
    videolist = BlocProvider.of<VideoGetCubit>(context)
        .fetchVideos(widget.type, widget.id);
    reviewlist = BlocProvider.of<ReviewsCubit>(context)
        .fetchMovieReviewsmovie(widget.type, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    print('from details page ${widget.id} ${widget.type}');
    print('from details page ${moviedetails.posterPath}');
    late bool isPressed = false;
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsLoaded) {
          moviedetails = state.details;
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        'https://image.tmdb.org/t/p/w500${moviedetails.posterPath}'))),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              addtofavorit();
                            },
                            icon: Icon(
                              isPressed == false
                                  ? Icons.favorite_border_rounded
                                  : Icons.favorite_rounded,
                              color: maincolor,
                            )),
                      )
                    ],
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 0.5,
                        backgroundColor: whitecolor,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: maincolor,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Hero(
                            tag: moviedetails.id!,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 20,
                                    spreadRadius: 10,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: CachedNetworkImage(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                fit: BoxFit.fill,
                                imageUrl:
                                    'https://image.tmdb.org/t/p/w500${moviedetails.posterPath}',
                                errorWidget: (context, url, error) {
                                  return Center(
                                    child: Image.asset(
                                        'asset/lottie/Animation - 1710423869605.gif'),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white54,
                                blurRadius: 20,
                                spreadRadius: 10,
                                offset: Offset(2, 2),
                              ),
                            ],
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(
                                20,
                              ),
                            ),
                          ),
                          child: Animate(
                            effects: [MoveEffect()],
                            child: SingleChildScrollView(
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: Column(
                                // scrollDirection: Axis.vertical,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: SelectableText(
                                      '${widget.type == 'tv' ? moviedetails.originalName : moviedetails.title}',
                                      style: const TextStyle(
                                          color: whitecolor, fontSize: 28),
                                    )
                                        .animate()
                                        .tint(color: whitecolor)
                                        .fade()
                                        .slide(),
                                  ),
                                  // GenresBlocBuilder(
                                  //     details11: moviedetails,
                                  //     id: moviedetails.id!),
                                  SelectableText(
                                    moviedetails.overview.toString(),
                                    style: const TextStyle(color: whitecolor),
                                  ),
                                  textRow('Trailer',
                                      CupertinoIcons.play_circle_fill),
                                  // TrailerBlocBuilder(
                                  //   videolist: videolist,
                                  //   type: widget.type,
                                  //   id: moviedetails.id!,
                                  // ),
                                  textRow('Reviews', CupertinoIcons.star_fill),
                                  ReviewsBlocBuilder(
                                    id: moviedetails.id!,
                                    reviewslist: reviewlist,
                                    type: widget.type,
                                  ),
                                  textRow(
                                      'Similer', Icons.safety_divider_sharp),
                                  SimilarBlocBuilder(
                                    model: moviedetails,
                                    id: moviedetails.id!,
                                    similarlist: similarlist,
                                    type: widget.type,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(),
                  )),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget textRow(String text, IconData icon) {
    return Row(
      children: [
        GlowIcon(
          icon,
          color: maincolor,
        ),
        const SizedBox(
          width: 10,
        ),
        GlowText(
          text,
          style: const TextStyle(color: whitecolor, fontSize: 18),
        ),
      ],
    );
  }

  void addtofavorit() {
    AppLocalStorge db = AppLocalStorge();
    db.addDetailsToList(moviedetails);
  }
}
