import 'package:dio/dio.dart';
import 'package:fmovies/src/core/api/cinemas_api_service.dart';

class CinemasApiServiceFactory implements CinemasApiService {
  final Dio cinemasClient;

  CinemasApiServiceFactory({this.cinemasClient});

  @override
  Future<Response> getNearbyCinemas(double latitude, double longitude) {
    return cinemasClient.request(
      '/maps/api/place/nearbysearch/json',
      queryParameters: {
        'location': '$latitude,$longitude',
        'radius': '10000',
        'type': 'movie_theater',
      },
      options: Options(
        method: 'GET',
        responseType: ResponseType.plain,
      ),
    );
  }
}
