import 'package:google_maps_flutter/google_maps_flutter.dart';

class CinemasState {
  CinemasState();
}

class CinemasLoading extends CinemasState {}

class CinemasLoaded extends CinemasState {
  final List<Marker> cinemas;

  CinemasLoaded(this.cinemas);
}

class CinemasError extends CinemasState {}
