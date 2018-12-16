import 'package:movie_info/src/bloc.dart';
import 'package:movie_info/src/movie_model.dart';
import 'package:movie_info/src/movie_provider.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc extends Bloc {
  MovieProvider provider = MovieProvider();
  // Movies
  BehaviorSubject<List<Movie>> _movies = BehaviorSubject(seedValue: []);
  Stream<List<Movie>> get movies$ => _movies.stream;
  Sink<List<Movie>> get _inMovies => _movies.sink;

  // Get Movies
  Subject<Null> _getMoviesStream = PublishSubject<Null>();
  Function(Null) get getMovies => _getMoviesStream.sink.add;

  MoviesBloc() {
    _getMoviesStream.listen(_getMovies);
  }

  _getMovies(Null v) async {
    // get movies from provider here
    List<Movie> movies = await provider.getAll();
    this._inMovies.add(movies);
  }

  @override
  void dispose() {
    _movies.close();
  }
}
