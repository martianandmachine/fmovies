import 'package:fmovies/src/features/popular/data/models/movie.dart';

class PopularMoviesEvent {
  PopularMoviesEvent();
}

class FetchPopularMovies extends PopularMoviesEvent {}

class SavePopularMovie extends PopularMoviesEvent {

  final Movie movie;

  SavePopularMovie(this.movie);
}