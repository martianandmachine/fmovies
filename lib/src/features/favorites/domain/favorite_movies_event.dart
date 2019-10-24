import 'package:flutter/foundation.dart';
import 'package:fmovies/src/core/db/database.dart';

class FavoriteMoviesEvent {
  FavoriteMoviesEvent();
}

class GetFavoriteMovies extends FavoriteMoviesEvent {}

class DeleteFavoriteMovie extends FavoriteMoviesEvent {
  final Movie movie;

  DeleteFavoriteMovie({@required this.movie});
}
