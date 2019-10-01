import 'dart:convert';

import 'package:fmovies/src/core/api/movies_api_service.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/network_info.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:get_it/get_it.dart';

class PopularMoviesRepositoryImpl implements PopularMoviesRepository {
  NetworkInfo _networkInfo;
  MoviesApiService _movieApiService;

  MoviesDao _moviesDao;

  int pageNumber = 1;

  PopularMoviesRepositoryImpl() {
    _networkInfo = GetIt.instance.get<NetworkInfo>();
    _movieApiService = GetIt.instance.get<MoviesApiService>();
    _moviesDao = GetIt.instance.get<MoviesDao>();
  }

  @override
  Future<Result<PopularMoviesResponse>> getPopularMovies() async {
    bool isConnected = await _networkInfo.isConnected();
    if (isConnected) {
      try {
        final response = await _movieApiService.getPopularMovies(pageNumber);

        pageNumber++;

        var parsed = json.decode(response.data);
        var model = PopularMoviesResponse.fromJson(parsed);

        await _checkIfMovieIsFavorite(model.results);

        return Result(success: model);
      } catch (error) {
        print(error.toString());
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  _checkIfMovieIsFavorite(List<Movie> movies) async {
    for (Movie movie in movies) {
      List<Movie> localMovie = await _moviesDao.getMovie(movie);

      if (localMovie.isNotEmpty) movie.isFavorite = true;
    }
  }
}
