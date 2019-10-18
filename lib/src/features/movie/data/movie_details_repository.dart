import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/movie/data/cast.dart';

abstract class MovieDetailsRepository {
  Future<Result<Movie>> getMovieDetails(int movieId);

  Future<Result<List<Cast>>> getMovieCredits(int movieId);
}
