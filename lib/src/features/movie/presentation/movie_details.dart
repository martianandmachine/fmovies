import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/image_constants.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_bloc.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_state.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  MovieDetails({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailsBloc bloc = BlocProvider.of<MovieDetailsBloc>(context);
    return Scaffold(
      body: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {

        },
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is ShowMovieDetails) {
              return Align(
                alignment: Alignment.center,
                child:  Hero(
                    tag: 'poster_${movie.posterPath}',
                    child: Image.network(
                        BASE_IMAGE_URL + POSTER_SIZES[SIZE_MEDIUM] + movie.posterPath
                    )
                ),
              );
            }
            return Text('');
          },
        ),
      ),
    );
  }

}