import 'package:fmovies/src/features/cinemas/data/model/cinema.dart';
import 'package:geolocator/geolocator.dart';

class CinemasState {
  CinemasState();
}

class ShowUser extends CinemasState {
  final Position position;

  ShowUser(this.position);
}

class CinemasLoading extends CinemasState {}

class CinemasLoaded extends CinemasState {
  final List<Cinema> cinemas;

  CinemasLoaded(this.cinemas);
}

class CinemasError extends CinemasState {
  final String errorMessage;

  CinemasError(this.errorMessage);
}
