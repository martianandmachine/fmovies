import 'package:bloc/bloc.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/favorites/data/favorite_movies_repository.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_event.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final PopularMoviesRepository popularMoviesRepository;
  final FavoriteMoviesRepository favoriteMoviesRepository;

  bool hasReachedEndOfResults = false;

  PopularMoviesBloc({
    this.popularMoviesRepository,
    this.favoriteMoviesRepository,
  });

  @override
  PopularMoviesState get initialState => PopularMoviesLoading();

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if (event is FetchPopularMovies) {
      yield* _mapFetchPopularMoviesToState(event);
    } else if (event is SavePopularMovie) {
      yield* _mapSavePopularMovieToState(event);
    }
  }

  Stream<PopularMoviesState> _mapFetchPopularMoviesToState(
      FetchPopularMovies event) async* {
    final results = await popularMoviesRepository.getPopularMovies();
    if (results.success != null) {
      int nextPage = results.success.page + 1;
      int totalPages = results.success.totalPages;

      if (nextPage == totalPages) hasReachedEndOfResults = true;

      if (currentState is PopularMoviesLoaded) {
        final List<Movie> movies =
        (currentState as PopularMoviesLoaded).movies.toList();

        movies.addAll(results.success.results);

        yield PopularMoviesLoaded(movies);
      } else {
        yield PopularMoviesLoaded(results.success.results);
      }
    } else {
      if (results.error is NoInternetError) {
        yield PopularMoviesNoInternet();
      }

      if (results.error is ServerError) {
        yield PopularMoviesServerError();
      }
    }
  }

  Stream<PopularMoviesState> _mapSavePopularMovieToState(
      SavePopularMovie event) async* {
    Movie movieToSave = event.movie;

    movieToSave.isFavorite = !movieToSave.isFavorite;

    final result =
    await favoriteMoviesRepository.saveMovieToFavorites(movieToSave);

    if (result.success != null) {
      if (currentState is PopularMoviesLoaded) {
        final List<Movie> updatedList =
        (currentState as PopularMoviesLoaded).movies.map((movie) {
          return movie.id == movieToSave.id ? movieToSave : movie;
        }).toList();

        yield PopularMoviesLoaded(updatedList, favoriteMovie: movieToSave);
      }
    }
  }
}
