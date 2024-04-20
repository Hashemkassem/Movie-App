// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/bussnic_logic/cubit/popularMovie/cubit/popular_movie_cubit.dart';
import 'package:movie_app/core/constants/app_string.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/persention/pages/homePage/nowPlaying_blocbuilder.dart';
import 'package:movie_app/persention/pages/homePage/onTheAirTv_blocbuilder.dart';
import 'package:movie_app/persention/pages/homePage/popularTv_blocbuilder.dart';
import 'package:movie_app/persention/pages/homePage/topRatedTv_blocbuild.dart';
import 'package:movie_app/persention/pages/homePage/top_ratedmovie_blocbuilder.dart';
import 'package:movie_app/persention/pages/homePage/upComing_blocbuilder.dart';

import '../../../data/models/details_model.dart';
import '../../widgets/slider_single_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late List<MovieModel> popularmoivelist;

  late DetailsModel details11;
  int showedIndex = 0;
  int index1 = 0;
  int page = 1;
  late final TabController _tabController1;
  final AdvancedDrawerController advancedDrawerController =
      AdvancedDrawerController();

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    popularmoivelist = BlocProvider.of<PopularMovieCubit>(context)
        .fetchPopularmovie('movie', page++);
    _tabController1 = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController1.dispose();
  }

  final List<Tab> _tabs = [
    const Tab(
      text: 'Top Rated Movie',
    ),
    const Tab(
      text: 'Now Playing Movie',
    ),
    const Tab(
      text: 'Up Coming Movie',
    ),
    const Tab(
      text: 'Popular TV',
    ),
    const Tab(
      text: 'Top Rated TV',
    ),
    const Tab(
      text: 'On The Air TV',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      openRatio: 0.55,
      controller: advancedDrawerController,
      animationCurve: Curves.bounceInOut,
      rtlOpening: false,
      backdropColor: Colors.black,
      drawer: SafeArea(
          child: Column(children: [
        DrawerHeader(
            decoration: BoxDecoration(),
            child: Icon(Icons.person_rounded, color: whitecolor, size: 50)),
        ListTile(
          onTap: () {
            // Navigator.pop(context);
          },
          leading: const Icon(Icons.home, color: whitecolor),
          title: Text(
            'Home',
            style: TextStyle(color: whitecolor),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              favoritepage,
              // arguments: (
              // Se
              // ),
            );
          },
          leading: const Icon(Icons.favorite, color: whitecolor),
          title: Text(
            'Favorite',
            style: TextStyle(color: whitecolor),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              searchpage,
              // arguments: (
              // Se
              // ),
            );
          },
          leading: const Icon(CupertinoIcons.search, color: whitecolor),
          title: Text(
            'Search',
            style: TextStyle(color: whitecolor),
          ),
        ),
        ListTile(
          onTap: () {
            // Navigator.pop(context);
          },
          leading: const Icon(Icons.web, color: whitecolor),
          title: Text(
            'Our WebSite',
            style: TextStyle(color: whitecolor),
          ),
        ),
        ListTile(
          onTap: () {
            // Navigator.pop(context);
          },
          leading: const Icon(Icons.subscriptions_rounded, color: whitecolor),
          title: Text(
            'Subscribs',
            style: TextStyle(color: whitecolor),
          ),
        ),
        ListTile(
          onTap: () {
            // Navigator.pop(context);
          },
          leading: const Icon(Icons.info, color: whitecolor),
          title: Text(
            'About',
            style: TextStyle(color: whitecolor),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
          leading: const Icon(Icons.exit_to_app, color: whitecolor),
          title: Text(
            'Quit',
            style: TextStyle(color: whitecolor),
          ),
        ),
      ])),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 4,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          leading: DrawerButton(
            style: ButtonStyle(
              iconColor: MaterialStateColor.resolveWith(
                (states) => whitecolor,
              ),
            ),
            onPressed: () {
              advancedDrawerController.showDrawer();
            },
          ),
          titleSpacing: 22,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Popular',
                style: TextStyle(color: maincolor),
              ),
              Lottie.asset('asset/lottie/fire.json', height: 40)
            ],
          ),
          backgroundColor: Colors.black.withOpacity(0.2),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.39,
                  child: buildPopularMovieWidget()),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),
              TabBar(
                isScrollable: true,
                physics: const ClampingScrollPhysics(),
                automaticIndicatorColorAdjustment: true,
                dividerColor: Colors.transparent,
                tabs: _tabs,
                unselectedLabelColor: maincolor.withOpacity(0.5),
                labelColor: whitecolor,
                controller: _tabController1,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    border: Border.all(color: whitecolor),
                    borderRadius: BorderRadius.circular(30),
                    color: maincolor.withOpacity(0.4)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.52,
                child: TabBarView(
                  controller: _tabController1,
                  children: const [
                    // buildTopRatedMovieWidget(),
                    TopRatedBlocBuilder(),
                    NowPlayingBlocBuilder(),
                    UpComingBlocBuilder(),

                    PopularTvBlocBuilder(),
                    TopRatedTvBlocBuild(),
                    OnTheAirTvBlocBuilder()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopularMovieWidget() {
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMoviesLoaded) {
          popularmoivelist = (state).movies;
          return buildScrollMovieWidget(state.movies);
        } else if (state is PopularMoviesLoading) {
          return Center(
            child: Image.asset('asset/lottie/Animation - 1710423869605.gif'),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                popularmoivelist = BlocProvider.of<PopularMovieCubit>(context)
                    .fetchPopularmovie('movie', 1);
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

  Widget buildScrollMovieWidget(List<MovieModel> popularmoivelist) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: (popularmoivelist).length,
          options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 600),
            height: MediaQuery.of(context).size.height * 0.38,
            enlargeCenterPage: true,
            viewportFraction: 1,
            initialPage: showedIndex,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
          ),
          itemBuilder: (context, index, realIndex) {
            index1 = index;
            // setState(() {
            //   index = index1;
            // });
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    //begin color
                    Colors.white.withOpacity(0.15),
                    //end color
                    Colors.white.withOpacity(0.05),
                  ],
                ),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  image: CachedNetworkImageProvider(
                    'https://image.tmdb.org/t/p/w500${popularmoivelist[index].posterPath}',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
        CarouselSlider.builder(
          itemCount: (popularmoivelist).length,
          options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 600),
            // height: MediaQuery.of(context).size.height * 0.3,
            enlargeCenterPage: true,
            viewportFraction: 0.36,
            initialPage: showedIndex,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
          ),
          itemBuilder: (context, index, realIndex) {
            return SingleItem(
              type: 'movie',
              id: popularmoivelist[index].id!,
              model: popularmoivelist[index],
            );
          },
        ),
      ],
    );
  }
}
