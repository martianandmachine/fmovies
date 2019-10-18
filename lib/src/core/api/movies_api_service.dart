import 'package:dio/dio.dart';

abstract class MoviesApiService {
  Future<Response> getPopularMovies(int page);

  Future<Response> getMovieDetails(int movieId);

  Future<Response> getMovieCredits(int movieId);
}
