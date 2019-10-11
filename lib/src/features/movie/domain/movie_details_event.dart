import 'package:fmovies/src/core/db/database.dart';

class MovieDetailsEvent {
  MovieDetailsEvent();
}

class FetchMovieDetails extends MovieDetailsEvent {
  final Movie movie;

  FetchMovieDetails(this.movie);
}

class FetchMovieCredits extends MovieDetailsEvent {
  final Movie movie;

  FetchMovieCredits(this.movie);
}
