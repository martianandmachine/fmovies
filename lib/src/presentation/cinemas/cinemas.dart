import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/domain/cinemas/cinemas_bloc.dart';
import 'package:fmovies/src/domain/cinemas/cinemas_state.dart';

class CinemasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final bloc = BlocProvider.of<CinemasBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cinemas nearby"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CinemasBloc, CinemasState>(
              builder: (context, state) {
                if (state is CinemasLoading) {
                  return CircularProgressIndicator();
                }
                if (state is CinemasLoaded) {
                  return Text('Finished loading');
                }
                return Text('Something went wrong');
              },
            ),
          ],
        ),
      ),
    );
  }
}