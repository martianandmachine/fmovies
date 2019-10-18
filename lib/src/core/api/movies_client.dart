import 'package:dio/dio.dart';

class MoviesClient {
  Dio build() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://api.themoviedb.org",
      queryParameters: {
        "api_key": "c1d17945fca15cf2153ab77f065ff55c",
      },
    );
    return Dio(baseOptions);
  }
}
