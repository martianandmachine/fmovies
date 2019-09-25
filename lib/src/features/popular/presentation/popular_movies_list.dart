import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/utils/image_constants.dart';
import 'package:fmovies/src/features/popular/data/models/movie.dart';
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
          return BuildListTile(movies[position]);
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

class BuildListTile extends StatelessWidget {
  final Movie movie;

  BuildListTile(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(movie.title),
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _buildPoster(movie.posterPath),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => print('TODO: Add ${movie.title} to favorites.'),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0, top: 5.0),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
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
}
