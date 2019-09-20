import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_bloc.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_event.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';

class PopularMoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PopularMoviesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Popular movies"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              builder: (context, state) {
                if (state is PopularMoviesLoading) {
                  return CircularProgressIndicator();
                }
                if (state is PopularMoviesLoaded) {
                  return Text('Finished loading');
                }
                return Text('Something went wrong');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.dispatch(FetchPopularMovies()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
