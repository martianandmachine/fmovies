import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/favorites/data/favorite_movies_repository.dart';
import 'package:get_it/get_it.dart';

class FavoriteMoviesRepositoryImpl implements FavoriteMoviesRepository {

  MoviesDao _moviesDao;

  FavoriteMoviesRepositoryImpl() {
    _moviesDao = GetIt.instance.get<MoviesDao>();
  }

  @override
  Future<Result> saveMovieToFavorites(Movie movie) async {
    try {
      _moviesDao.insertMovie(movie);
      return Result(success: movie);
    } catch (error) {
      print('Inserting error - ' + error.toString());
      return Result(error: DbInsertError());
    }
  }

  @override
  Future<Result<List<Movie>>> getFavoriteMovies() async {
    try {
      List<Movie> movies = await _moviesDao.getFavoriteMovies();
      return Result(success: movies);
    } catch (error) {
      print('Geting movies error - ' + error.toString());
      return Result(error: DbDataError());
    }
  }
}