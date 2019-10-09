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
      final results =
          await movieDetailsRepository.getMovieDetails(event.movie.id);
      if (results.success != null) {
        yield ShowExtraDetails(results.success);
      } else {
        if (results.error is NoInternetError) {}
        if (results.error is ServerError) {}
      }
    }
  }
}
