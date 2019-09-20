import 'package:bloc/bloc.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_event.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';
import 'package:get_it/get_it.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  @override
  PopularMoviesState get initialState => PopularMoviesLoading();

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if (event is FetchPopularMovies) {
      print('Fetch movies triggered');

      var popularMoviesRepository = GetIt.instance.get<PopularMoviesRepository>();

      final Result results = await popularMoviesRepository.getPopularMovies();
      
      yield PopularMoviesLoaded();
    }
  }
}
