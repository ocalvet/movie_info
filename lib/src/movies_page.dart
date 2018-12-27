import 'package:flutter/material.dart';
import 'package:movie_info/src/bloc_provider.dart';
import 'package:movie_info/src/movie_model.dart';
import 'package:movie_info/src/movie_page.dart';
import 'package:movie_info/src/movie_widget.dart';
import 'package:movie_info/src/movies_bloc.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoviesBloc bloc = BlocProvider.of<MoviesBloc>(context);
    bloc.getCurrentlyPlayingMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieInfo'),
      ),
      body: StreamBuilder(
        stream: bloc.movies$,
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return _buildMovieList(snapshot.data);
          }
          return _loading();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          bloc.getCurrentlyPlayingMovies();
        },
      ),
    );
  }

  Widget _loading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          Text('Loading Movies')
        ],
      ),
    );
  }

  Widget _buildMovieList(List<Movie> movieList) {
    return Center(
        child: ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (BuildContext context, int index) {
        Movie movie = movieList[index];
        return MovieWidget(movie: movie);
      },
    ));
  }
}
