import 'package:flutter/material.dart';
import 'package:movie_info/src/bloc_provider.dart';
import 'package:movie_info/src/home_page.dart';
import 'package:movie_info/src/movies_bloc.dart';
import 'package:movie_info/src/playing_now_page.dart';
import 'package:movie_info/src/splash_screen.dart';
import 'package:movie_info/src/trending_page.dart';
import 'package:movie_info/src/upcoming_page.dart';

class MovieInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      bloc: MoviesBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'MovieInfo',
        initialRoute: '/splash',
        routes: {
          '/': (context) => HomePage(),
          '/splash': (context) => SplashScreen(),
          '/movies': (context) => PlayingNowPage(),
          '/trending': (context) => TrendingPage(),
          '/upcoming': (context) => UpcomingPage(),
        },
      ),
    );
  }
}
