import 'package:bloc/bloc.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/cinemas/data/cinemas_repository.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_event.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_state.dart';
import 'package:get_it/get_it.dart';

class CinemasBloc extends Bloc<CinemasEvent, CinemasState> {
  CinemasRepository _cinemasRepository;

  CinemasBloc() {
    _cinemasRepository = GetIt.instance.get<CinemasRepository>();
  }

  @override
  CinemasState get initialState => CinemasLoading();

  @override
  Stream<CinemasState> mapEventToState(CinemasEvent event) async* {
    if (event is CannotFetchLocation) {
      yield CinemasError('Error fetching user location..');
    }
    if (event is FetchCinemas) {
      FetchCinemas cinemas = event;
      yield ShowUser(cinemas.position);
      final results = await _cinemasRepository.getNearbyCinemas(
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
}
