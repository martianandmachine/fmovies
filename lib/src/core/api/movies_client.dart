import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fmovies/src/core/utils/secret.dart';

class MoviesClient {
  final Secret secret;

  MoviesClient({@required this.secret});

  Dio build() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://api.themoviedb.org",
      queryParameters: {
        "api_key": secret.tmdbKey,
      },
    );
    return Dio(baseOptions);
  }
}
