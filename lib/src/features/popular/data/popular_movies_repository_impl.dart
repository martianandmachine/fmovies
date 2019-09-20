import 'package:dartz/dartz.dart';
import 'package:fmovies/src/core/errors/exceptions.dart';
import 'package:fmovies/src/core/utils/network_info.dart';
import 'package:fmovies/src/features/popular/data/models/popular_movies_response.dart';
import 'package:fmovies/src/features/popular/data/popular_movies_repository.dart';

class PopularMoviesRepositoryImpl implements PopularMoviesRepository {
  @override
  Future<Either<PopularMoviesResponse, Exception>> getPopularMovies() async {
    
    bool isConnected = await NetworkInfo().isConnected();
    
    if (isConnected) {
      
    } else {
      Right(NoInternetException());
    }

  }
}
