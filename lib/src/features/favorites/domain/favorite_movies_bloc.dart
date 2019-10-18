import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/features/favorites/data/favorite_movies_repository.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_event.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_state.dart';

class FavoriteMoviesBloc
    extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  final FavoriteMoviesRepository favoriteMoviesRepository;

  FavoriteMoviesBloc({@required this.favoriteMoviesRepository});

  @override
  FavoriteMoviesState get initialState => FavoriteMoviesLoading();

  @override
  Stream<FavoriteMoviesState> mapEventToState(
      FavoriteMoviesEvent event) async* {
    if (event is GetFavoriteMovies) {
      yield* _mapGetFavoriteMoviesToState(event);
    } else if (event is DeleteFavoriteMovie) {
      yield* _mapDeleteFavoriteMovieToState(event);
    }
  }

  Stream<FavoriteMoviesState> _mapGetFavoriteMoviesToState(
      GetFavoriteMovies event) async* {
    final results = await favoriteMoviesRepository.getFavoriteMovies();

    if (results.success != null) {
      if (results.success.length == 0) {
        yield FavoriteMoviesEmpty();
      } else
        yield FavoriteMoviesLoaded(results.success);
    }
  }

  Stream<FavoriteMoviesState> _mapDeleteFavoriteMovieToState(
      DeleteFavoriteMovie event) async* {
    final result =
        await favoriteMoviesRepository.deleteMovieFromFavorites(event.movie);

    if (result != null) {
      final List<Movie> movies =
          List.from((currentState as FavoriteMoviesLoaded).movies)
            ..removeWhere((movie) => movie.id == event.movie.id);

      if (movies.isEmpty)
        yield FavoriteMoviesEmpty();
      else
        yield currentState;
    } else {
      yield currentState;
    }
  }
}
