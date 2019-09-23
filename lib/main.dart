import 'package:flutter/material.dart';
import 'package:fmovies/src/core/api/movies_api_service.dart';
import 'package:fmovies/src/core/api/movies_api_service_factory.dart';
import 'package:fmovies/src/core/app.dart';
import 'package:fmovies/src/core/utils/network_info.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton<MoviesApiService>(() => MoviesApiServiceFactory());

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo());

  getIt.registerFactory<PopularMoviesRepository>(
    () => PopularMoviesRepositoryImpl(),
  );

  runApp(App());
}
