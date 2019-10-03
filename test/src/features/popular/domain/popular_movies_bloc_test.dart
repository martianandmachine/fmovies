import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/favorites/data/favorite_movies_repository.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_bloc.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_event.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../data_factory.dart';

class MockPopularMoviesRepository extends Mock
    implements PopularMoviesRepository {}

class MockFavoriteMoviesRepository extends Mock
    implements FavoriteMoviesRepository {}

const MoviesLoading = TypeMatcher<PopularMoviesLoading>();
const MoviesLoaded = TypeMatcher<PopularMoviesLoaded>();
const MoviesNoInternet = TypeMatcher<PopularMoviesNoInternet>();
const MoviesServerError = TypeMatcher<PopularMoviesServerError>();

main() {
  PopularMoviesBloc popularMoviesBloc;

  PopularMoviesRepository popularMoviesRepository =
      MockPopularMoviesRepository();

  FavoriteMoviesRepository favoriteMoviesRepository =
      MockFavoriteMoviesRepository();

  setUp(() {
    popularMoviesBloc = PopularMoviesBloc(
        popularMoviesRepository: popularMoviesRepository,
        favoriteMoviesRepository: favoriteMoviesRepository);
  });

  test('should return loading state as inital state', () {
    expect(popularMoviesBloc.initialState, MoviesLoading);
  });

  group('fetching popular movies', () {
    test('should return success state when fetching movies is successful',
        () async {
      PopularMoviesResponse popularMoviesResponse =
          DataFactory.createPopularMovieResponse();
      Result<PopularMoviesResponse> result =
          Result(success: popularMoviesResponse);

      when(popularMoviesRepository.getPopularMovies())
          .thenAnswer((_) async => result);

      popularMoviesBloc.dispatch(FetchPopularMovies());

      expect(
          popularMoviesBloc.state, emitsInOrder([MoviesLoading, MoviesLoaded]));
    });

    test('should return no internet state when there is no internet', () {
      Error error = NoInternetError();
      Result<PopularMoviesResponse> result = Result(error: error);

      when(popularMoviesRepository.getPopularMovies())
          .thenAnswer((_) async => result);

      popularMoviesBloc.dispatch(FetchPopularMovies());

      expect(popularMoviesBloc.state,
          emitsInOrder([MoviesLoading, MoviesNoInternet]));
    });

    test(
        'should return server error state when something is wrong with the server',
        () {
      Error error = ServerError();
      Result<PopularMoviesResponse> result = Result(error: error);

      when(popularMoviesRepository.getPopularMovies())
          .thenAnswer((_) async => result);

      popularMoviesBloc.dispatch(FetchPopularMovies());

      expect(popularMoviesBloc.state,
          emitsInOrder([MoviesLoading, MoviesServerError]));
    });
  });

  group('saving movie to favorites', () {
    test(
        'should return success state when saving movie to favorites is successful',
        () {
      Movie movie = DataFactory.createMovie();
      Movie movieToSave = movie;

      movieToSave.isFavorite = !movieToSave.isFavorite;

      Result<Movie> result = Result(success: movieToSave);

      when(favoriteMoviesRepository.saveMovieToFavorites(movieToSave))
          .thenAnswer((_) async => result);

      popularMoviesBloc.dispatch(SavePopularMovie(movie));

      expect(
          popularMoviesBloc.state, emitsInOrder([MoviesLoading, MoviesLoaded]));
    });

    test(
        'should return current state when saving movie to favorites is unsuccessful',
        () {
      Movie movie = DataFactory.createMovie();
      Error error = DbInsertError();
      Result<Movie> result = Result(error: error);

      when(favoriteMoviesRepository.saveMovieToFavorites(movie))
          .thenAnswer((_) async => result);

      popularMoviesBloc.dispatch(SavePopularMovie(movie));

      expect(popularMoviesBloc.currentState, MoviesLoading);
    });
  });
}
