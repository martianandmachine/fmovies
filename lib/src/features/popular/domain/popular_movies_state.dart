import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/features/popular/data/models/movie.dart';

class PopularMoviesState {
  PopularMoviesState();
}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;

  final Movie favoriteMovie;

  PopularMoviesLoaded(this.movies, {this.favoriteMovie});
}

class PopularMoviesNoInternet extends PopularMoviesState {}

class PopularMoviesServerError extends PopularMoviesState {}