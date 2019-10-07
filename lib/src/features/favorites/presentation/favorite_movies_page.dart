import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/widgets/snackbar.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_bloc.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_event.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_state.dart';
import 'package:fmovies/src/features/favorites/presentation/favorite_movies_list.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';

class FavoriteMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteMoviesBloc>(context);

    bloc.dispatch(GetFavoriteMovies());

    return Scaffold(
      appBar: AppBar(
        title: Text("Popular movies"),
      ),
      body: BlocListener<FavoriteMoviesBloc, FavoriteMoviesState>(
        listener: (context, state) {},
        child: BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
          builder: (context, state) {
            if (state is FavoriteMoviesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FavoriteMoviesLoaded) {
              return FavoriteMoviesList(state.movies);
            }
            if (state is FavoriteMoviesEmpty) {
              return Center(
                child: Text('Empty.'),
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
}
