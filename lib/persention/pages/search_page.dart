// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bussnic_logic/cubit/cubit/search_cubit.dart';

import '../../core/constants/app_string.dart';
import '../../data/models/movie_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  late List<MovieModel> searchlist;
  @override
  void initState() {
    super.initState();
    searchlist = BlocProvider.of<SearchCubit>(context)
        .fetchsearchList(_controller.text.toString(), 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whitecolor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text('Search 🤔',
              style: TextStyle(color: whitecolor, fontSize: 20)),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        child: Column(
          children: [buildSearchBar(), buildSearchBlocBuilder()],
        ),
      ),
    );
  }

  Widget buildSearchBlocBuilder() {
    print('object');
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoaded) {
            searchlist = state.search;

            return searchlist.isEmpty
                ? Center(
                    child: Image.asset(
                        'asset/lottie/Animation - 1713516693683.gif'),
                  )
                : ListView.builder(
                    itemCount: searchlist.length,
                    itemBuilder: (context, index) {
                      return singleSearchResult(searchlist[index]);
                    },
                  );
          } else if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: whitecolor,
              ),
            );
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  searchlist = BlocProvider.of<SearchCubit>(context)
                      .fetchsearchList(_controller.text, 1);
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
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        onChanged: (value) {
          context.read<SearchCubit>().fetchsearchList(value, 1);
        },
        controller: _controller,
        obscureText: false,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search_rounded),
            hintText: 'Search',
            fillColor: Colors.white.withOpacity(0.5),
            filled: true,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }

  Widget singleSearchResult(MovieModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  onError: (exception, stackTrace) {
                    FadeInImage.assetNetwork(
                      placeholder: 'asset/lottie/Animation - 1710423869605.gif',
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      model.mediaType! == 'tv'
                          ? model.originalName!
                          : model.originalTitle!,
                      style: const TextStyle(color: whitecolor, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "type: ${model.mediaType!}",
                    style: const TextStyle(color: whitecolor, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      model.overview!,
                      maxLines: 4,
                      style: const TextStyle(color: whitecolor, fontSize: 14),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
