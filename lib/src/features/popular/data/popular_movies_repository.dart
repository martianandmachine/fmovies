import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';

abstract class PopularMoviesRepository {
  Future<Result<PopularMoviesResponse>> getPopularMovies();
}
