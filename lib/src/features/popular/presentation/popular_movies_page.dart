import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_bloc.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_event.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';
import 'package:fmovies/src/features/popular/presentation/popular_movies_list.dart';

class PopularMoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PopularMoviesBloc>(context);

    bloc.dispatch(FetchPopularMovies());

    List<Movie> movies = List<Movie>();

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
          if (state is PopularMoviesLoaded) {
            if (state.favoriteMovie != null) {
              if (state.favoriteMovie.isFavorite) {
                _showSnackBar(context, state.favoriteMovie.title + ' added to favorites.');
              } else _showSnackBar(context, state.favoriteMovie.title + ' removed from favorites.');
            }
          }
        },
        child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) {
            if (state is PopularMoviesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PopularMoviesLoaded) {
              movies.addAll(state.movies);
              return PopularMoviesList(movies);
            }
            if (state is PopularMoviesNoInternet && movies.isEmpty) {
              return Center(
                child: RaisedButton.icon(
                  onPressed: () => bloc.dispatch(FetchPopularMovies()),
                  icon: Icon(Icons.refresh),
                  label: Text('Try again.'),
                ),
              );
            }
            return Center(
              child: Text('Something went wrong.'),
            );
          },
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
