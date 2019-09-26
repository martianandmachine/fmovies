import 'dart:convert';

import 'package:fmovies/src/core/api/movies_api_service.dart';
import 'package:fmovies/src/core/db/moor_database.dart';
import 'package:fmovies/src/core/utils/network_info.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/popular/data/models/movie.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:moor_flutter/moor_flutter.dart';

class PopularMoviesRepositoryImpl implements PopularMoviesRepository {
  NetworkInfo _networkInfo;
  MoviesApiService _movieApiService;
  MoorMoviesDao _moorMoviesDao;

  int pageNumber = 1;

  PopularMoviesRepositoryImpl() {
    _networkInfo = GetIt.instance.get<NetworkInfo>();
    _movieApiService = GetIt.instance.get<MoviesApiService>();
    _moorMoviesDao = GetIt.instance.get<MoorMoviesDao>();
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

        return Result(success: model);
      } catch (error) {
        print(error.toString());
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }

  @override
  Future<Result> savePopularMovie(Movie movie) async {
    try {
      print('save movie - ' + movie.title);
      final moorMovie = MoorMoviesCompanion(
        title: Value(movie.title),
      );

      _moorMoviesDao.insertMovie(moorMovie);
    } catch (error) {
      print('Inserting error - ' + error.toString());
    }

    try {
      List<MoorMovie> moorMovies = await _moorMoviesDao.getAllMovies();

      print('getting all movies...');
      moorMovies.forEach((movie) => {print(movie.title)});
    } catch (error) {
      print('Geting movies error - ' + error.toString());
    }

    return null;
  }
}
