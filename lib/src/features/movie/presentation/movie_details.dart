import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    print(movie);
    return Scaffold(
      body: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {},
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is ShowMovieDetails) {
              return SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          child: Image.network(
                            BASE_IMAGE_URL +
                                POSTER_SIZES[SIZE_LARGE] +
                                movie.backdropPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              150.0, 16.0, 16.0, 48.0),
                          child: Text(
                            movie.title,
                            style: TextStyle(
                              fontSize: 30,
                              shadows: [
                                Shadow(
                                  color: Colors.red,
                                  blurRadius: 10.0,
                                  offset: Offset(-5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Description:'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(movie.overview),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 170,
                      left: 16,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: Hero(
                            tag: 'poster_${movie.posterPath}',
                            child: Image.network(
                              BASE_IMAGE_URL +
                                  POSTER_SIZES[SIZE_MEDIUM] +
                                  movie.posterPath,
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 16,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ],
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
