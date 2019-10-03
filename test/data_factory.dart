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

  static String dummyJsonResponse() {
    return "{\"page\":1,\"total_results\":10000,\"total_pages\":500,\"results\":[{\"popularity\":211.653,\"vote_count\":290,\"video\":false,\"poster_path\":\"\/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg\",\"id\":522938,\"adult\":false,\"backdrop_path\":\"\/spYx9XQFODuqEVoPpvaJI1ksAVt.jpg\",\"original_language\":\"en\",\"original_title\":\"Rambo: Last Blood\",\"genre_ids\":[28,53],\"title\":\"Rambo: Last Blood\",\"vote_average\":6.2,\"overview\":\"When John Rambo's niece travels to Mexico to find the father that abandoned her and her mother, she finds herself in the grasps of Calle Mexican sex traffickers. When she doesn't return home as expected, John learns she's crossed into Mexico and sets out to get her back and make them pay.\",\"release_date\":\"2019-09-20\"}]}";
  }
}
