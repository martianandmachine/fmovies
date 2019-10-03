import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fmovies/src/core/api/movies_api_service.dart';
import 'package:fmovies/src/core/db/database.dart';
import 'package:fmovies/src/core/utils/network_info.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../data_factory.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockMoviesApiService extends Mock implements MoviesApiService {}

class MockMoviesDao extends Mock implements MoviesDao {}

class MockResponse extends Mock implements Response {}

main() {
  PopularMoviesRepositoryImpl popularMoviesRepositoryImpl;

  NetworkInfo networkInfo = MockNetworkInfo();

  MoviesApiService moviesApiService = MockMoviesApiService();

  MoviesDao moviesDao = MockMoviesDao();

  setUp(() {
    popularMoviesRepositoryImpl = PopularMoviesRepositoryImpl(
      networkInfo: networkInfo,
      movieApiService: moviesApiService,
      moviesDao: moviesDao,
    );
  });

  test('should return popular movies when request is successful', () async {
    String jsonResponse = DataFactory.dummyJsonResponse();
    Response response = Response(data: jsonResponse);
    var parsed = json.decode(response.data);

    PopularMoviesResponse popularMoviesResponse =
        PopularMoviesResponse.fromJson(parsed);

    Result<PopularMoviesResponse> expectedResult =
        Result(success: popularMoviesResponse);

    Movie movie = popularMoviesResponse.results[0];

    when(networkInfo.isConnected()).thenAnswer((_) async => true);

    when(moviesApiService.getPopularMovies(1))
        .thenAnswer((_) async => response);

    when(moviesDao.getMovie(movie)).thenAnswer((_) async => List());

    Result<PopularMoviesResponse> result =
        await popularMoviesRepositoryImpl.getPopularMovies();

    expect(result.success.results, expectedResult.success.results);
  });

  test(
      'should return server error state when something is wrong with parsing data',
      () async {
    Error error = ServerError();

    when(networkInfo.isConnected()).thenAnswer((_) async => true);

    when(moviesApiService.getPopularMovies(1)).thenThrow(() => error);

    Result<PopularMoviesResponse> result =
        await popularMoviesRepositoryImpl.getPopularMovies();

    expect(result.error, isInstanceOf<ServerError>());
  });

  test('should return no internet error when there is no connection', () async {
    when(networkInfo.isConnected()).thenAnswer((_) async => false);

    Result<PopularMoviesResponse> result =
        await popularMoviesRepositoryImpl.getPopularMovies();

    expect(result.error, isInstanceOf<NoInternetError>());
  });
}
