import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:movie_info/src/secrets.dart';

class SecretsLoader {
  final String secretPath;
  SecretsLoader({this.secretPath});
  Future<Secrets> load() {
    return rootBundle.loadStructuredData<Secrets>(this.secretPath,
        (jsonStr) async {
      final secrets = Secrets.fromJson(json.decode(jsonStr));
      return secrets;
    });
  }
}
