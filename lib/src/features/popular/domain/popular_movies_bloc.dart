import 'package:bloc/bloc.dart';
import 'package:fmovies/src/core/db/database.dart';
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

  List<Movie> movies = List<Movie>();

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

        movies.addAll(results.success.results);

        yield PopularMoviesLoaded(movies);
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
      Movie movieToSave = event.movie;

      movieToSave.isFavorite = !movieToSave.isFavorite;

      final result =
          await _favoriteMoviesRepository.saveMovieToFavorites(movieToSave);

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
}
