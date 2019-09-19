import 'package:bloc/bloc.dart';
import 'package:fmovies/src/domain/cinemas/cinemas_event.dart';
import 'package:fmovies/src/domain/cinemas/cinemas_state.dart';

class CinemasBloc extends Bloc<CinemasEvent, CinemasState> {
  @override
  // TODO: implement initialState
  CinemasState get initialState => CinemasLoading();

  @override
  Stream<CinemasState> mapEventToState(CinemasEvent event) async* {
    if (event is FetchCinemas) {
      yield CinemasLoaded();
    }
  }
}
