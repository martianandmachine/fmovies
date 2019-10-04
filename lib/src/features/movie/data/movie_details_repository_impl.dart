import 'dart:convert';

import 'package:fmovies/src/core/api/movies_api_service.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/network_info.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/movie/data/movie_details_repository.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  NetworkInfo networkInfo;
  MoviesApiService movieApiService;

  MovieDetailsRepositoryImpl({this.networkInfo, this.movieApiService});

  @override
  Future<Result<Movie>> getMovieDetails(int movieId) async {
    bool isConnected = await networkInfo.isConnected();
    if (isConnected) {
      try {
        final response = await movieApiService.getMovieDetails(movieId);
        var parsed = json.decode(response.data);

        var model = Movie.fromJson(parsed);

        return Result(success: model);
      } catch (error) {
        print(error.toString());
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
