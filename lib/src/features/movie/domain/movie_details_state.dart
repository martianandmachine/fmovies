import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/features/movie/data/cast.dart';

class MovieDetailsState {
  MovieDetailsState();
}

class ShowMovieDetails extends MovieDetailsState {}

class ShowExtraDetails extends MovieDetailsState {
  final Movie movie;

  ShowExtraDetails(this.movie);
}

class ShowCredits extends MovieDetailsState {
  final List<Cast> cast;

  ShowCredits(this.cast);
}

class MovieDetailsError extends MovieDetailsState{
  final String errorMessage;

  MovieDetailsError(this.errorMessage);
}