import 'package:dio/dio.dart';
import 'package:fmovies/src/core/api/movies_api_service.dart';

class MoviesApiServiceFactory implements MoviesApiService {
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
        "api_key": "c1d17945fca15cf2153ab77f065ff55c",
      },
      options: Options(
        method: "GET",
        responseType: ResponseType.plain,
      ),
    );
  }
}
