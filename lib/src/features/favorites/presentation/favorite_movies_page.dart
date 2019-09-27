import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_bloc.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_state.dart';

class FavoriteMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteMoviesBloc>(context);

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
            if (state is FavoriteMoviesLoaded) {}
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
