import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/ui/blurred_image.dart';
import 'package:fmovies/src/core/utils/image_constants.dart';

class FavoriteMoviesList extends StatelessWidget {
  final List<Movie> movies;

  FavoriteMoviesList(this.movies);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, position) {
        return BuildFavoriteListTile(movies[position]);
      },
    );
  }
}

class BuildFavoriteListTile extends StatelessWidget {
  final Movie movie;

  BuildFavoriteListTile(this.movie);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width * 0.5;

    return GestureDetector(
      onTap: () => print(movie.title),
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
                  Column(
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 170.0,
                          minWidth: 170.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
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
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            movie.releaseDate,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    if (path == null) {
      return Image.asset('images/placeholder.png');
    } else {
      return FadeInImage.assetNetwork(
        placeholder: 'images/placeholder.png',
        image: BASE_IMAGE_URL + path,
      );
    }
  }
}
