import 'package:fmovies/src/core/db/database.dart';

class PopularMoviesEvent {
  PopularMoviesEvent();
}

class FetchPopularMovies extends PopularMoviesEvent {}

class SavePopularMovie extends PopularMoviesEvent {
  final Movie movie;

  SavePopularMovie(this.movie);
}
