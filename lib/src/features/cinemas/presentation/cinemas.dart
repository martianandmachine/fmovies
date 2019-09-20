import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_bloc.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CinemasPage extends StatefulWidget {
  @override
  State<CinemasPage> createState() => CinemasPageState();
}

class CinemasPageState extends State<CinemasPage> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
//    final bloc = BlocProvider.of<CinemasBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinemas nearby"),
      ),
      body:Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          BlocBuilder<CinemasBloc, CinemasState>(
            builder: (context, state) {
              if (state is CinemasLoading) {
                print('Loading map');
                return Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CinemasLoaded) {
                return Text('Finished loading');
              }
              return Text('Something went wrong');
            },
          ),
        ],
      ),
    );
  }

}