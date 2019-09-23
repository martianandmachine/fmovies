import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fmovies/src/core/api/movie_api_service.dart';

class MovieApiServiceFactory implements MovieApiService {
  @override
  buildClient() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://api.themoviedb.org",
    );

    return Dio(baseOptions);
  }

  @override
  getPopularMovies() {
    Dio client = buildClient();
    return client.request(
      "/3/discover/movie",
      queryParameters: {
        "sort_by": "popularity.desc",
      },
      data: {
        "api_key": "c1d17945fca15cf2153ab77f065ff55c",
      },
      options: Options(
        method: "GET",
        responseType: ResponseType.json,
      ),
    );
  }
}
