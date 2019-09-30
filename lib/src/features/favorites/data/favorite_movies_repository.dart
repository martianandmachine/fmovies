import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/result.dart';

abstract class FavoriteMoviesRepository {
  Future<Result> saveMovieToFavorites(Movie movie);

  Future<Result<List<Movie>>> getFavoriteMovies();
}