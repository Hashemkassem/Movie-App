// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:movie_app/app_route.dart';

void main() async {
  runApp(MyMovieApp(
    appRoute: AppRoute(),
  ));
}

class MyMovieApp extends StatelessWidget {
  const MyMovieApp({
    Key? key,
    required this.appRoute,
  }) : super(key: key);

  final AppRoute appRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRout,
    );
  }
}
