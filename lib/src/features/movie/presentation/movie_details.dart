import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/image_constants.dart';
import 'package:fmovies/src/core/widgets/snackbar.dart';
import 'package:fmovies/src/features/movie/data/cast.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_bloc.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_event.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_state.dart';
import 'package:fmovies/src/features/movie/presentation/movie_details_text_widgets.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  MovieDetails({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MovieDetailsBloc>(context);
    Movie extraDetails;
    List<Cast> cast;

    bloc.dispatch(FetchMovieDetails(movie));
    bloc.dispatch(FetchMovieCredits(movie));
    return Scaffold(
      body: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {
          if (state is MovieDetailsError) {
            ShowSnackBar(context, state.errorMessage);
          }
        },
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is ShowExtraDetails) {
              extraDetails = state.movie;
              cast = state.cast;
            }
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    expandedHeight: 250,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Image.network(
                          BASE_IMAGE_URL +
                              POSTER_SIZES[SIZE_LARGE] +
                              movie.backdropPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      titlePadding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                      centerTitle: true,
                      title: MovieDetailsTextWidgets()
                          .buildSectionTitle(movie.title),
                    ),
                  ),
                ];
              },
              body: Stack(
                overflow: Overflow.clip,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(BASE_IMAGE_URL +
                              POSTER_SIZES[SIZE_LARGE] +
                              movie.backdropPath),
                          fit: BoxFit.fitHeight),
                    ),
                    child: new BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Card(
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
                            if (state is ShowExtraDetails)
                              _buildExtraDetails(extraDetails),
                          ],
                        ),
                      ),
                      if (state is ShowExtraDetails &&
                          extraDetails.tagline.length > 0)
                        MovieDetailsTextWidgets()
                            .buildTagline(extraDetails.tagline),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child:
                              MovieDetailsTextWidgets().buildText(movie.overview),
                        ),
                      ),
                      if (state is ShowExtraDetails) _buildMovieCast(cast),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildExtraDetails(Movie extraDetails) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 8.0,
          runSpacing: 4.0,
          children: <Widget>[
            MovieDetailsTextWidgets()
                .buildText('Status: ${extraDetails.status}'),
            MovieDetailsTextWidgets()
                .buildText('Rating: ${extraDetails.voteAverage}'),
            MovieDetailsTextWidgets()
                .buildText('Popularity: ${extraDetails.popularity}'),
            MovieDetailsTextWidgets()
                .buildText('Budget: ${extraDetails.budget}\$'),
            MovieDetailsTextWidgets()
                .buildText('Revenue: ${extraDetails.revenue}\$'),
          ],
        ));
  }

  Widget _buildMovieCast(List<Cast> cast) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(4.0),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    BASE_IMAGE_URL +
                         CAST_SIZE +
                        cast[index].profilePath,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    width: 160,
                    child: Container(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(4),
                      child: MovieDetailsTextWidgets().buildCastName(
                          cast[index].name, cast[index].character),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
