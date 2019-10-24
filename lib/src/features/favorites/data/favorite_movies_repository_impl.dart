import 'package:flutter/foundation.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/favorites/data/favorite_movies_repository.dart';

class FavoriteMoviesRepositoryImpl implements FavoriteMoviesRepository {
  final MoviesDao moviesDao;

  FavoriteMoviesRepositoryImpl({@required this.moviesDao});

  @override
  Future<Result<Movie>> saveMovieToFavorites(Movie movie) async {
    try {
      List<Movie> movies = await moviesDao.getMovie(movie);

      if (movies.isEmpty) {
        moviesDao.insertMovie(movie);
      } else {
        moviesDao.deleteMovie(movie);
      }
      return Result(success: movie);
    } catch (error) {
      return Result(error: DbInsertError());
    }
  }

  @override
  Future<Result<List<Movie>>> getFavoriteMovies() async {
    try {
      List<Movie> movies = await moviesDao.getFavoriteMovies();
      return Result(success: movies);
    } catch (error) {
      return Result(error: DbDataError());
    }
  }

  @override
  Future<Result<Movie>> deleteMovieFromFavorites(Movie movie) async {
    try {
      moviesDao.deleteMovie(movie);
      return Result(success: movie);
    } catch (error) {
      return Result(error: DbDeleteError());
    }
  }
}
