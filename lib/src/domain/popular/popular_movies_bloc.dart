import 'package:fmovies/src/domain/popular/popular_movies_event.dart';
import 'package:fmovies/src/domain/popular/popular_movies_state.dart';
import 'package:bloc/bloc.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  @override
  PopularMoviesState get initialState => PopularMoviesLoading();

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {

  }
}