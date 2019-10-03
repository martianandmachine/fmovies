import 'package:flutter/foundation.dart';
import 'package:fmovies/src/features/favorites/data/favorite_movies_repository.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_event.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_state.dart';
import 'package:bloc/bloc.dart';

class FavoriteMoviesBloc extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {

  final FavoriteMoviesRepository favoriteMoviesRepository;

  FavoriteMoviesBloc({@required this.favoriteMoviesRepository});

  @override
  FavoriteMoviesState get initialState => FavoriteMoviesLoading();

  @override
  Stream<FavoriteMoviesState> mapEventToState(FavoriteMoviesEvent event) async* {
    if (event is GetFavoriteMovies) {
      final results = await favoriteMoviesRepository.getFavoriteMovies();

      if (results.success != null) {
        if (results.success.length == 0) {
          yield FavoriteMoviesEmpty();
        } else yield FavoriteMoviesLoaded(results.success);
      }
    }
  }
}