import 'package:fmovies/src/features/favorites/data/favorite_movies_repository.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_event.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_state.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

class FavoriteMoviesBloc extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {

  FavoriteMoviesRepository _favoriteMoviesRepository;

  FavoriteMoviesBloc() {
    _favoriteMoviesRepository = GetIt.instance.get<FavoriteMoviesRepository>();
  }

  @override
  FavoriteMoviesState get initialState => FavoriteMoviesLoading();

  @override
  Stream<FavoriteMoviesState> mapEventToState(FavoriteMoviesEvent event) async* {
    if (event is GetFavoriteMovies) {
      final results = await _favoriteMoviesRepository.getFavoriteMovies();

      if (results.success != null) {
        if (results.success.length == 0) {
          yield FavoriteMoviesEmpty();
        } else yield FavoriteMoviesLoaded(results.success);
      }
    }
  }
}