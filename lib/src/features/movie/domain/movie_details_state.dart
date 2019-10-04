import 'package:fmovies/src/core/db/database.dart';

class MovieDetailsState {
  MovieDetailsState();
}

class ShowMovieDetails extends MovieDetailsState {}

class ShowExtraDetails extends MovieDetailsState {
  final Movie movie;

  ShowExtraDetails(this.movie);
}

class MovieDetailsError extends MovieDetailsState{
  final String errorMessage;

  MovieDetailsError(this.errorMessage);
}