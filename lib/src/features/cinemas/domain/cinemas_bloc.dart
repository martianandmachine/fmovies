import 'package:bloc/bloc.dart';
import 'package:fmovies/src/features/cinemas/data/cinemas_repository.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_event.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CinemasBloc extends Bloc<CinemasEvent, CinemasState> {
  CinemasRepository _cinemasRepository;

  CinemasBloc() {
    _cinemasRepository = GetIt.instance.get<CinemasRepository>();
  }

  @override
  CinemasState get initialState => CinemasLoading();

  @override
  Stream<CinemasState> mapEventToState(CinemasEvent event) async* {
    if (event is FetchCinemas) {
      yield CinemasLoaded(<Marker>[]);
    }
  }
}
