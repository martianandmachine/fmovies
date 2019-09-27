import 'package:fmovies/src/features/favorites/domain/favorite_movies_event.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_state.dart';
import 'package:bloc/bloc.dart';

class FavoriteMoviesBloc extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  @override
  FavoriteMoviesState get initialState => FavoriteMoviesLoading();

  @override
  Stream<FavoriteMoviesState> mapEventToState(FavoriteMoviesEvent event) {

    return null;
  }
}