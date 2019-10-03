import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/result.dart';

abstract class FavoriteMoviesRepository {
  Future<Result<Movie>> saveMovieToFavorites(Movie movie);

  Future<Result<Movie>> deleteMovieFromFavorites(Movie movie);

  Future<Result<List<Movie>>> getFavoriteMovies();
}