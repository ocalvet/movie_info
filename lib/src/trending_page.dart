import 'package:flutter/material.dart';
import 'package:movie_info/src/bloc_provider.dart';
import 'package:movie_info/src/movie_model.dart';
import 'package:movie_info/src/movie_widget.dart';
import 'package:movie_info/src/movies_bloc.dart';

class TrendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoviesBloc bloc = BlocProvider.of<MoviesBloc>(context);
    bloc.getTrending();
    return Scaffold(
      appBar: AppBar(title: Text('Trending Movies')),
      body: StreamBuilder(
        stream: bloc.trendingMovies$,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Movie movie = snapshot.data[index];
              return MovieWidget(movie: movie);
            },
            itemCount: snapshot.data.length,
          );
        },
      ),
    );
  }
}
