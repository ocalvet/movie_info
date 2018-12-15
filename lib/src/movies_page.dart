import 'package:flutter/material.dart';
import 'package:movie_info/src/movie_model.dart';
import 'package:movie_info/src/movie_provider.dart';

class MoviesPage extends StatefulWidget {
  @override
  MoviesPageState createState() {
    return new MoviesPageState();
  }
}

class MoviesPageState extends State<MoviesPage> {
  List<Movie> movieList = List<Movie>();
  @override
  void initState() {
    super.initState();
    moviesProvider.getAll().then((movies) {
      this.setState(() {
        movieList = movies;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieInfo'),
      ),
      body: this.movieList.length > 0
          ? _buildMovieList()
          : Center(
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
            ),
    );
  }

  _buildMovieList() {
    return Center(
        child: ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (BuildContext context, int index) {
        Movie movie = movieList[index];
        return ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.overview),
        );
      },
    ));
  }
}
