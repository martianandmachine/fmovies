import 'package:fmovies/src/core/db/database.dart';

class FavoriteMoviesState {
  FavoriteMoviesState();
}

class FavoriteMoviesLoading extends FavoriteMoviesState {}

class FavoriteMoviesLoaded extends FavoriteMoviesState {
  final List<Movie> movies;

  FavoriteMoviesLoaded(this.movies);
}

class FavoriteMoviesEmpty extends FavoriteMoviesState {}
