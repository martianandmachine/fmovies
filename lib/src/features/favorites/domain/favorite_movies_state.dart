import 'package:fmovies/src/core/db/database.dart';

class FavoriteMoviesState {
  FavoriteMoviesState();
}

class FavoriteMoviesLoading extends FavoriteMoviesState {}

class FavoriteMoviesLoaded extends FavoriteMoviesState {
  final List<Movie> movies;
  final Movie deletedMovie;

  FavoriteMoviesLoaded(this.movies, {this.deletedMovie});
}

class FavoriteMoviesEmpty extends FavoriteMoviesState {}