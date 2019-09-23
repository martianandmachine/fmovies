import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fmovies/src/core/utils/network_info.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:get_it/get_it.dart';

class PopularMoviesRepositoryImpl implements PopularMoviesRepository {

  NetworkInfo _networkInfo;

  PopularMoviesRepositoryImpl() {
    _networkInfo = GetIt.instance.get<NetworkInfo>();
  }

  @override
  Future<Result<PopularMoviesResponse>> getPopularMovies() async {
    bool isConnected = await _networkInfo.isConnected();

    if (isConnected) {
      Dio dio = Dio();

      String url =
          "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=c1d17945fca15cf2153ab77f065ff55c";

      try {
        final response = await dio.get<String>(url);

        var parsed = json.decode(response.data);
        var model = PopularMoviesResponse.fromJson(parsed);

        return Result(success: model);
      } catch(error) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
