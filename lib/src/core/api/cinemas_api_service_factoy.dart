import 'package:dio/dio.dart';
import 'package:fmovies/src/core/api/cinemas_api_service.dart';

class CinemasApiServiceFactory implements CinemasApiService {
  @override
  Dio buildClient() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://maps.googleapis.com",
      queryParameters: {
        "key": "AIzaSyCmRJiynYcCjxYRgbGJEY9eyM9VPYhI_XE",
      },
    );

    return Dio(baseOptions);
  }

  @override
  Future<Response> getNearbyCinemas(double latitude, double longitude) {
    Dio client = buildClient();
    return client.request(
      "/maps/api/place/nearbysearch/json",
      queryParameters: {
        "location": "$latitude,$longitude",
        "radius": "10000",
        "type": "movie_theater",
      },
      options: Options(
        method: "GET",
        responseType: ResponseType.plain,
      ),
    );
  }
}
