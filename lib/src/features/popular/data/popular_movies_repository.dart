import 'package:dartz/dartz.dart';
import 'package:fmovies/src/core/errors/exceptions.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';

abstract class PopularMoviesRepository {

  Future<Either<PopularMoviesResponse, Exception>> getPopularMovies();
}