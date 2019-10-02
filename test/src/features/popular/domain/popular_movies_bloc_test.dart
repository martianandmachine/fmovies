import 'package:fmovies/src/features/favorites/data/favorite_movies_repository.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_bloc.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';


class MockPopularMoviesRepository extends Mock implements PopularMoviesRepository {}

class MockFavoriteMoviesRepository extends Mock implements FavoriteMoviesRepository {}

const MoviesLoading = TypeMatcher<PopularMoviesLoading>();

main() {
  PopularMoviesBloc popularMoviesBloc;

  PopularMoviesRepository popularMoviesRepository = MockPopularMoviesRepository();

  FavoriteMoviesRepository favoriteMoviesRepository = MockFavoriteMoviesRepository();

  setUp(() {
    popularMoviesBloc = PopularMoviesBloc(
      popularMoviesRepository: popularMoviesRepository,
      favoriteMoviesRepository: favoriteMoviesRepository
    );
  });

  test('emits loading state as inital state', () {
    expect(popularMoviesBloc.initialState, MoviesLoading);
  });
}
