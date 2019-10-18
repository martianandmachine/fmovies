import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fmovies/src/core/utils/secret.dart';

class CinemasClient {
  final Secret secret;

  CinemasClient({@required this.secret});

  Dio build() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://maps.googleapis.com",
      queryParameters: {
        "key": secret.placesKey,
      },
    );
    return Dio(baseOptions);
  }
}
