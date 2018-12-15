import 'package:flutter/material.dart';
import 'package:movie_info/src/home_page.dart';
import 'package:movie_info/src/movies_page.dart';

class MovieInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'MovieInfo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/movies': (context) => MoviesPage(),
      },
    );
  }
}
