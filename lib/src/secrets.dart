class Secrets {
  final String moviesApiKey;
  final String androidMapsApiKey;
  Secrets({this.moviesApiKey = "", this.androidMapsApiKey = ""});
  factory Secrets.fromJson(Map<String, dynamic> jsonMap) {
    return new Secrets(
      moviesApiKey: jsonMap["movies_api_key"],
      androidMapsApiKey: jsonMap["android_maps_sdk_key"],
    );
  }
}
