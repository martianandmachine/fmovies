import 'package:dio/dio.dart';
import 'package:fmovies/src/core/api/movies_api_service.dart';

class MoviesApiServiceFactory implements MoviesApiService {

  final Dio moviesClient;

  MoviesApiServiceFactory({this.moviesClient});

  @override
  getPopularMovies(int page) {
    return moviesClient.request(
      "/3/movie/now_playing",
      queryParameters: {
        "sort_by": "popularity.desc",
        "page": "$page",
      },
      options: Options(
        method: "GET",
        responseType: ResponseType.plain,
      ),
    );
  }

  @override
  getMovieDetails(int movieId) {
    return moviesClient.request(
      "/3/movie/$movieId",
      queryParameters: {
        "append_to_response": "credits,videos,images",
      },
      options: Options(
        method: "GET",
        responseType: ResponseType.plain,
      ),
    );
  }

  @override
  getMovieCredits(int movieId) {
    return moviesClient.request(
      "/3/movie/$movieId/credits",
      options: Options(
        method: "GET",
        responseType: ResponseType.plain,
      ),
    );
  }
}
