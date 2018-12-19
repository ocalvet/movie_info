import 'package:flutter/material.dart';
import 'package:movie_info/src/movie_model.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;
  MoviePage({this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Center(
        child: Text('I guess a movie'),
      ),
    );
  }
}
