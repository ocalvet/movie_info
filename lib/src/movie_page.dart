import 'package:flutter/material.dart';
import 'package:movie_info/src/movie_model.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;
  MoviePage({this.movie});
  @override
  Widget build(BuildContext context) {
    DateTime releaseDate =DateTime.parse(movie.releaseDate);
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white54)),
              padding: EdgeInsets.all(5.0),
              child: Text('${movie.title} - ${releaseDate.month}/${releaseDate.day}/${releaseDate.year}'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7.0),
            ),
            Text(movie.overview),
          ],
        ),
      ),
    );
  }
}
