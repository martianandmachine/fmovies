import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/di/di.dart';
import 'package:fmovies/src/core/utils/image_constants.dart';
import 'package:fmovies/src/core/widgets/blurred_image.dart';
import 'package:fmovies/src/core/widgets/snackbar.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_bloc.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_event.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_bloc.dart';
import 'package:fmovies/src/features/movie/presentation/movie_details.dart';

class FavoriteMoviesList extends StatelessWidget {
  final List<Movie> movies;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  FavoriteMoviesList(this.movies);

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: movies.length,
      itemBuilder: (context, position, animation) {
        return BuildFavoriteListTile(
            movies[position], animation, position, movies, _listKey);
      },
    );
  }
}

class BuildFavoriteListTile extends StatelessWidget {
  final Movie movie;
  final Animation animation;
  final int position;
  final List<Movie> movies;
  final GlobalKey<AnimatedListState> listKey;

  BuildFavoriteListTile(
      this.movie, this.animation, this.position, this.movies, this.listKey);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteMoviesBloc>(context);
    double width = MediaQuery.of(context).size.width;
    double height = width * 0.5;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              builder: (context) => getIt<MovieDetailsBloc>(),
              child: MovieDetails(movie: movie),
            );
          },
        ),
      ),
      onLongPress: () => _deleteMovie(bloc),
      child: SizeTransition(
        sizeFactor: animation,
        child: Container(
          height: height,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              BlurredImage(BASE_IMAGE_URL +
                  BACKDROP_SIZES[SIZE_MEDIUM] +
                  movie.backdropPath),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildImage(POSTER_SIZES[SIZE_MEDIUM] + movie.posterPath),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      width: 170.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Text(
                                    movie.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 4.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => print('heart tapped'),
                                child: _buildIcon(),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Vote average: " + movie.voteAverage.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 4.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    if (path == null) {
      return Image.asset('images/placeholder.png');
    } else {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: FadeInImage.assetNetwork(
            placeholder: 'images/placeholder.png',
            image: BASE_IMAGE_URL + path,
          ),
        ),
      );
    }
  }

  _deleteMovie(FavoriteMoviesBloc bloc) {
    Movie removedItem = movies.removeAt(position);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      animation.addStatusListener((listener) {
        if (listener == AnimationStatus.dismissed) {
          bloc.dispatch(DeleteFavoriteMovie(movie: movie));
          ShowSnackBar(context, movie.title + ' deleted from favorites.');
        }
      });

      return BuildFavoriteListTile(
          removedItem, animation, position, movies, listKey);
    };

    listKey.currentState.removeItem(position, builder);
  }

  Widget _buildIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
      child: Container(
        width: 23.0,
        height: 23.0,
        child: FlareActor(
          'assets/Favorite.flr',
          shouldClip: false,
          snapToEnd: true,
          color: Colors.white,
          animation: 'Favorite',
        ),
      ),
    );
  }
}
