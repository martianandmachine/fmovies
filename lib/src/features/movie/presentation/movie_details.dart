import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_bloc.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_state.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  MovieDetails({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {

        },
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is ShowMovieDetails) {
              return Align(
                alignment: Alignment.center,
                child: Text('$movie'),
              );
            }
            return Text('');
          },
        ),
      ),
    );
  }

}