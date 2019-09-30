import 'package:bloc/bloc.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/favorites/data/favorite_movies_repository.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_event.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';
import 'package:get_it/get_it.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesRepository _popularMoviesRepository;
  FavoriteMoviesRepository _favoriteMoviesRepository;

  bool hasReachedEndOfResults = false;

  PopularMoviesBloc() {
    _popularMoviesRepository = GetIt.instance.get<PopularMoviesRepository>();
    _favoriteMoviesRepository = GetIt.instance.get<FavoriteMoviesRepository>();
  }

  @override
  PopularMoviesState get initialState => PopularMoviesLoading();

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if (event is FetchPopularMovies) {
      final results = await _popularMoviesRepository.getPopularMovies();
      if (results.success != null) {
        int nextPage = results.success.page + 1;
        int totalPages = results.success.totalPages;

        if (nextPage == totalPages) hasReachedEndOfResults = true;
        yield PopularMoviesLoaded(results.success.results);
      } else {
        if (results.error is NoInternetError) {
          yield PopularMoviesNoInternet();
        }

        if (results.error is ServerError) {
          yield PopularMoviesServerError();
        }
      }
    }

    if (event is SavePopularMovie) {
      final result =
          await _favoriteMoviesRepository.saveMovieToFavorites(event.movie);
      if (result.success != null) {
        print(event.movie.title + ' inserted');
      } else {
        print('error');
      }
    }
  }
}
