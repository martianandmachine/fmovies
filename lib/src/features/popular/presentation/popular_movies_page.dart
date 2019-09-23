import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_bloc.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_event.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';

class PopularMoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PopularMoviesBloc>(context);

    bloc.dispatch(FetchPopularMovies());

    return Scaffold(
      appBar: AppBar(
        title: Text("Popular movies"),
      ),
      body: BlocListener<PopularMoviesBloc, PopularMoviesState>(
        listener: (context, state) {
          if (state is PopularMoviesNoInternet) {
            _showSnackBar(context, 'Check yout internet connection.');
          }
          if (state is PopularMoviesServerError) {
            _showSnackBar(context, 'Something went wrong with the server.');
          }
        },
        child: Center(
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
                  return RaisedButton.icon(
                    onPressed: () => bloc.dispatch(FetchPopularMovies()),
                    icon: Icon(Icons.refresh),
                    label: Text('Try again.'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
