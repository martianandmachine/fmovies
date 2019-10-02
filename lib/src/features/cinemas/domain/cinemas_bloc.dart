import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/cinemas/data/cinemas_repository.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_event.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_state.dart';

class CinemasBloc extends Bloc<CinemasEvent, CinemasState> {
  final CinemasRepository cinemasRepository;

  CinemasBloc({@required this.cinemasRepository});

  @override
  CinemasState get initialState => CinemasLoading();

  @override
  Stream<CinemasState> mapEventToState(CinemasEvent event) async* {
    if (event is CannotFetchLocation) {
      yield* _mapCannotFetchLocationToState(event);
    } else if (event is FetchCinemas) {
      yield* _mapFetchCinemasToState(event);
    }
  }

  Stream<CinemasState> _mapCannotFetchLocationToState(
      CannotFetchLocation event) async* {
    yield CinemasError('Error fetching user location..');
  }

  Stream<CinemasState> _mapFetchCinemasToState(FetchCinemas event) async* {
    FetchCinemas cinemas = event;
    yield ShowUser(cinemas.position);
    final results = await cinemasRepository.getNearbyCinemas(
        cinemas.position.latitude, cinemas.position.longitude);
    if (results.success != null) {
      if (results.success.errorMessage != null) {
        yield CinemasError(results.success.errorMessage);
      } else {
        yield CinemasLoaded(results.success.results);
      }
    } else {
      if (results.error is NoInternetError) {
        yield CinemasError('No internet connection.');
      }
      if (results.error is ServerError) {
        yield CinemasError('Something went wrong with server.');
      }
    }
  }
}
