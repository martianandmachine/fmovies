import 'package:flutter/material.dart';
import 'package:fmovies/src/core/utils/image_constants.dart';
import 'package:fmovies/src/features/popular/data/models/movie.dart';

class PopularMoviesList extends StatelessWidget {
  final List<Movie> movies;

  const PopularMoviesList(this.movies);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, position) {
        return BuildListTile(movies[position]);
      },
    );
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
          child: FadeInImage.assetNetwork(
            placeholder: 'images/placeholder.png',
            image:
                BASE_IMAGE_URL + POSTER_SIZES[SIZE_MEDIUM] + movie.posterPath,
            fit: BoxFit.cover,
          ),
      ),
    );
  }
}
