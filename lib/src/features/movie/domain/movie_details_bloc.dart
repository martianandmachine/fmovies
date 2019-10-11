import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/movie/data/movie_details_repository.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_event.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsRepository movieDetailsRepository;

  MovieDetailsBloc({@required this.movieDetailsRepository});

  @override
  MovieDetailsState get initialState => ShowMovieDetails();

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event) async* {
    if (event is FetchMovieDetails) {
      final details =
          await movieDetailsRepository.getMovieDetails(event.movie.id);
      final credits =
          await movieDetailsRepository.getMovieCredits(event.movie.id);
      if (details.success != null && credits.success != null) {
        var filteredCast = credits.success.where((c) => c.profilePath != null).toList();
        yield ShowExtraDetails(details.success, filteredCast);
      } else {
        if (details.error is NoInternetError) {}
        if (details.error is ServerError) {}
        if (credits.error is NoInternetError) {}
        if (credits.error is ServerError) {}
      }
    }
  }
}
