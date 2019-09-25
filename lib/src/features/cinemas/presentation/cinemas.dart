import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/utils/image_utils.dart';
import 'package:fmovies/src/core/utils/location_service.dart';
import 'package:fmovies/src/features/cinemas/data/model/cinema.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_bloc.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_event.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CinemasPage extends StatefulWidget {
  @override
  State<CinemasPage> createState() => CinemasPageState();
}

class CinemasPageState extends State<CinemasPage> {
  CinemasBloc bloc;

  final Map<String, Marker> _markers = {};
  CameraPosition _currentCameraPosition;
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(0, 0),
    zoom: 1,
  );

  @override
  void initState() {
    bloc = BlocProvider.of<CinemasBloc>(context);
    _getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinemas nearby"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: _initialCamera,
            markers: _markers.values.toSet(),
          ),
          BlocListener<CinemasBloc, CinemasState>(
            listener: (context, state) {
              if (state is ShowUser) {
                _addUserMarker(state.position);
              }
              if (state is CinemasLoaded) {
                _addCinemasToMap(state.cinemas);
              }
              if (state is CinemasError) {
                _showSnackBar(context, state.errorMessage);
              }
            },
            child: BlocBuilder<CinemasBloc, CinemasState>(
              builder: (context, state) {
                if (state is CinemasLoading) {
                  return Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                }
                return Text('');
              },
            ),
          ),
        ],
      ),
    );
  }

  _getUserLocation() async {
    Position position = await LocationService().getLocation();
    if (position != null) {
      bloc.dispatch(FetchCinemas(position));
    } else {
      bloc.dispatch(CannotFetchLocation());
    }
  }

  _addUserMarker(Position position) async {
    _currentCameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 13);
    final GoogleMapController controller = await _controller.future;
    if (Platform.isAndroid) {
      controller
          .animateCamera(CameraUpdate.newCameraPosition(_currentCameraPosition));
    } else if (Platform.isIOS) {
      controller
          .moveCamera(CameraUpdate.newCameraPosition(_currentCameraPosition));
    }
    final marker = Marker(
      markerId: MarkerId('user'),
      infoWindow: InfoWindow(title: 'Me'),
      zIndex: 1.0,
      icon: await ImageUtils().getIcon(1.0, 'images/marker.png'),
      position: LatLng(position.latitude, position.longitude),
    );
    setState(() {
      if (_markers.containsKey('user')) {
        _markers.remove('user');
      }
      _markers['user'] = marker;
    });
  }

  _addCinemasToMap(List<Cinema> cinemas) {
    List<Marker> newMarkers = [];
    for (var cinema in cinemas) {
      Marker m = Marker(
        markerId: MarkerId(cinema.id),
        infoWindow: InfoWindow(title: cinema.name),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        position:
            LatLng(cinema.geometry.location.lat, cinema.geometry.location.lng),
      );
      newMarkers.add(m);
    }
    setState(() {
      for (var m in newMarkers) {
        if (_markers.containsKey(m.markerId.value)) {
          _markers.remove(m.markerId.value);
        }
        _markers[m.markerId.value] = m;
      }
    });
  }

  _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
