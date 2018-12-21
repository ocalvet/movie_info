import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_info/src/credits_model.dart';
import 'package:movie_info/src/movie_model.dart';
import 'package:movie_info/src/secrets_loader.dart';

class MovieProvider {
  final SecretsLoader secretsLoader = SecretsLoader(secretPath: "lib/assets/secrets.json");
  Future<List<Movie>> getAll() async {
    var secrets = await secretsLoader.load();
    var uri = Uri.https(
      'api.themoviedb.org',
      '/3/movie/now_playing',{
        'api_key': secrets.moviesApiKey
      }
    );
    print(uri);
    var response = await http.get(uri.toString());
    List<Movie> list = (json.decode(response.body)['results'] as List)
      .map((json) => Movie.fromJson(json))
      .toList();
    return list;
  }
  
  Future<CreditsModel> getCredits(int movieId) async {
    var secrets = await secretsLoader.load();
    var uri = Uri.https(
      'api.themoviedb.org',
      '/3/movie/$movieId/credits',{
        'api_key': secrets.moviesApiKey
      }
    );
    print(uri);
    var response = await http.get(uri.toString());
    CreditsModel credits = (CreditsModel.fromJson(json.decode(response.body)));
    return credits;
  }
}

MovieProvider moviesProvider = MovieProvider();
