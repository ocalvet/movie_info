import 'package:flutter/material.dart';
import 'package:movie_info/src/bloc_provider.dart';
import 'package:movie_info/src/credits_model.dart';
import 'package:movie_info/src/movie_model.dart';
import 'package:movie_info/src/movies_bloc.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;
  MoviePage({this.movie});
  @override
  Widget build(BuildContext context) {
    DateTime releaseDate = DateTime.parse(movie.releaseDate);
    MoviesBloc bloc = BlocProvider.of<MoviesBloc>(context);
    bloc.getCredits(movie.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              "http://image.tmdb.org/t/p/original${movie.posterPath}",
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white54)),
              padding: EdgeInsets.all(5.0),
              child: Text(
                  '${movie.title} - ${releaseDate.month}/${releaseDate.day}/${releaseDate.year}'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7.0),
            ),
            Text(movie.overview),
            StreamBuilder(
              stream: bloc.credits$,
              builder: (BuildContext context, AsyncSnapshot<CreditsModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.cast.map((cast) => Text(cast.name)).toList(),
                  );
                } 
                return CircularProgressIndicator();
            },
            )
          ],
        ),
      ),
    );
  }
}
