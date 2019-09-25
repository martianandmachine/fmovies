import 'package:geolocator/geolocator.dart';

class CinemasEvent {
  CinemasEvent();
}

class FetchCinemas extends CinemasEvent {
  final Position position;

  FetchCinemas(this.position);
}
