import 'package:bloc/bloc.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_event.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  @override
  MovieDetailsState get initialState => ShowMovieDetails();

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event) {
    if (event is FetchMovieDetails) {

    }
    return null;
  }

}