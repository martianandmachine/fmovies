import 'package:bloc/bloc.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_event.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';
import 'package:get_it/get_it.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {

  PopularMoviesRepository _popularMoviesRepository;

  PopularMoviesBloc() {
    _popularMoviesRepository = GetIt.instance.get<PopularMoviesRepository>();
  }

  @override
  PopularMoviesState get initialState => PopularMoviesLoading();

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if (event is FetchPopularMovies) {
      print('Fetch movies triggered');

      final results = await _popularMoviesRepository.getPopularMovies();

      if (results.success != null) {
        print('Success = ' + results.success.results[0].title);
      }

      if (results.error is NoInternetError) {
        print('There is no internet');
      }

      if (results.error is ServerError) {
        print('Server error');
      }
      
      yield PopularMoviesLoaded();
    }
  }
}
