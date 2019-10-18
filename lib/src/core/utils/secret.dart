import 'dart:convert';

import 'package:flutter/services.dart';

class Secret {
  final String tmdbKey;
  final String placesKey;

  Secret({this.tmdbKey = "", this.placesKey = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return Secret(
      tmdbKey: jsonMap['tmdb_key'],
      placesKey: jsonMap['places_key'],
    );
  }

  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>('assets/secrets.json',
        (jsonStr) async {
      return Secret.fromJson(json.decode(jsonStr));
    });
  }
}
