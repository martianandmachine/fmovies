import 'dart:math';

import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';

class DataFactory {
  static int randomInt() {
    return Random().nextInt(100);
  }

  static String randomString() {
    return (Random().nextInt(100) +
            Random().nextInt(1000) +
            Random().nextDouble())
        .toString();
  }

  static bool randomBool() {
    return Random().nextBool();
  }

  static Movie createMovie() {
    return Movie(
        id: randomInt(),
        voteCount: randomInt(),
        posterPath: randomString(),
        adult: randomBool(),
        originalTitle: randomString(),
        title: randomString(),
        overview: randomString(),
        releaseDate: randomString(),
        backdropPath: randomString(),
        isFavorite: randomBool());
  }

  static List<Movie> createMovies() {
    return List<Movie>.generate(3, (index) {
      return createMovie();
    });
  }

  static PopularMoviesResponse createPopularMovieResponse() {
    return PopularMoviesResponse(
        page: 1, totalPages: 10, results: createMovies());
  }
}
