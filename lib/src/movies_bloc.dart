import 'package:movie_info/src/bloc.dart';
import 'package:movie_info/src/credits_model.dart';
import 'package:movie_info/src/movie_model.dart';
import 'package:movie_info/src/movie_provider.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc extends Bloc {
  MovieProvider provider = MovieProvider();
  // Movies
  BehaviorSubject<List<Movie>> _movies = BehaviorSubject(seedValue: []);
  Stream<List<Movie>> get movies$ => _movies.stream;
  Sink<List<Movie>> get _inMovies => _movies.sink;
  // Trending Movies
  BehaviorSubject<List<Movie>> _trendingMovies = BehaviorSubject(seedValue: []);
  Stream<List<Movie>> get trendingMovies$ => _trendingMovies.stream;
  Sink<List<Movie>> get _inTrendingMovies => _trendingMovies.sink;
  // Upcoming Movies
  BehaviorSubject<List<Movie>> _upcomingMovies = BehaviorSubject(seedValue: []);
  Stream<List<Movie>> get upcomingMovies$ => _upcomingMovies.stream;
  Sink<List<Movie>> get _inupcomingMovies => _upcomingMovies.sink;
  // Credits
  BehaviorSubject<CreditsModel> _credits = BehaviorSubject();
  Stream<CreditsModel> get credits$ => _credits.stream;
  Sink<CreditsModel> get _inCredits => _credits.sink;
  // Get Credits
  void getCredits(int movieId) async {
    CreditsModel credits = await provider.getCredits(movieId);
    this._inCredits.add(credits);
  }
  // Get Movies
  void getCurrentlyPlayingMovies() async {
    List<Movie> movies = await provider.getAll();
    movies.sort((movieA, movieB) => -movieA.voteCount.compareTo(movieB.voteCount));
    this._inMovies.add(movies);
  }

  void getTrending() async {
    List<Movie> movies = await provider.getTrending();
    movies.sort((movieA, movieB) => -movieA.voteCount.compareTo(movieB.voteCount));
    this._inTrendingMovies.add(movies);
  }

  void getUpcoming() async {
    List<Movie> movies = await provider.getUpcoming();
    movies.sort((movieA, movieB) => -movieA.voteCount.compareTo(movieB.voteCount));
    this._inupcomingMovies.add(movies);
  }

  @override
  void dispose() {
    _movies.close();
    _trendingMovies.close();
    _credits.close();
    _upcomingMovies.close();
  }
}
