import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/result.dart';

abstract class MovieDetailsRepository {
  Future<Result<Movie>> getMovieDetails(int movieId);
}