import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/di/di.dart';
import 'package:fmovies/src/core/utils/image_constants.dart';
import 'package:fmovies/src/features/movie/domain/movie_details_bloc.dart';
import 'package:fmovies/src/features/movie/presentation/movie_details.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_bloc.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_event.dart';

class PopularMoviesList extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  final List<Movie> movies;

  PopularMoviesList(this.movies);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PopularMoviesBloc>(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) =>
          _handleScrollNotification(notification, bloc),
      child: GridView.builder(
        itemCount: _calculateItemCount(bloc),
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, position) {
          if (position >= movies.length) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return BuildPopularListTile(movies[position], bloc);
        },
      ),
    );
  }

  int _calculateItemCount(PopularMoviesBloc bloc) {
    if (bloc.hasReachedEndOfResults) {
      return movies.length;
    } else {
      return movies.length + 1;
    }
  }

  bool _handleScrollNotification(
      ScrollNotification notification, PopularMoviesBloc bloc) {
    if (notification is ScrollEndNotification && !bloc.hasReachedEndOfResults) {
      bloc.dispatch(FetchPopularMovies());
    }
    return false;
  }
}

class BuildPopularListTile extends StatelessWidget {
  final Movie movie;

  final PopularMoviesBloc bloc;

  BuildPopularListTile(this.movie, this.bloc);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              builder: (context) => MovieDetailsBloc(movieDetailsRepository: getIt()),
              child: MovieDetails(movie: movie),
            );
          },
        ),
      ),
      child: Card(
        child: Stack(
          children: <Widget>[
            Hero(
                tag: 'poster_${movie.posterPath}',
                child: _buildPoster(movie.posterPath)),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => bloc.dispatch(SavePopularMovie(movie)),
                child: _buildIcon(movie.isFavorite),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster(String posterPath) {
    if (posterPath == null) {
      return Image.asset('images/placeholder.png');
    } else {
      return FadeInImage.assetNetwork(
        placeholder: 'images/placeholder.png',
        image: BASE_IMAGE_URL + POSTER_SIZES[SIZE_MEDIUM] + movie.posterPath,
        fit: BoxFit.cover,
      );
    }
  }

  Widget _buildIcon(bool isFavorite) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 10.0),
      child: Container(
        width: 23.0,
        height: 23.0,
        child: FlareActor(
          "assets/Favorite.flr",
          shouldClip: false,
          color: Colors.white,
          animation: isFavorite ? "Favorite" : "Unfavorite",
        ),
      ),
    );
  }
}
