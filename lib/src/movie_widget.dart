import 'package:flutter/material.dart';
import 'package:movie_info/src/movie_model.dart';
import 'package:movie_info/src/movie_page.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;
  const MovieWidget({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        alignment: Alignment.topLeft,
        width: 60,
        color: Colors.red,
        child: Image.network(
          "http://image.tmdb.org/t/p/w92${movie.posterPath}",
          fit: BoxFit.fitWidth,
          alignment: Alignment.topLeft,
        ),
      ),
      title: Text("${movie.title} - (${movie.voteCount})"),
      subtitle: Text(movie.overview),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return MoviePage(
            movie: movie,
          );
        }));
        print('Selected ${movie.title}');
      },
    );
  }
}
