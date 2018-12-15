class Secrets {
  final String moviesApiKey;
  Secrets({this.moviesApiKey = ""});
  factory Secrets.fromJson(Map<String, dynamic> jsonMap) {
    return new Secrets(moviesApiKey: jsonMap["movies_api_key"]);
  }
}