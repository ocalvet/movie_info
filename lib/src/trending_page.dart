import 'package:flutter/material.dart';
import 'package:movie_info/src/bloc_provider.dart';
import 'package:movie_info/src/movie_model.dart';
import 'package:movie_info/src/movies_bloc.dart';

class TrendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoviesBloc bloc = BlocProvider.of<MoviesBloc>(context);
    bloc.getTrending();
    return Scaffold(
      appBar: AppBar(title: Text('Trending Page')),
      body: StreamBuilder(
        stream: bloc.trendingMovies$,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Movie movie = snapshot.data[index];
              return ListTile(title: Text(movie.title));
            },
            itemCount: snapshot.data.length,
          );
        },
      ),
    );
  }
}
