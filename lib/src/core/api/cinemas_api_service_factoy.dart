import 'package:dio/dio.dart';
import 'package:fmovies/src/core/api/cinemas_api_service.dart';

class CinemasApiServiceFactory implements CinemasApiService {
  @override
  buildClient() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://maps.googleapis.com",
    );

    return Dio(baseOptions);
  }

  @override
  getNearbyCinemas(double latitude, double longitude) {
    Dio client = buildClient();
    return client.request(
      "/maps/api/place/nearbysearch/json",
      queryParameters: {
        "location": "$latitude,$longitude",
        "radius": "1500",
        "type": "movie_theater",
        "key": "AIzaSyCmRJiynYcCjxYRgbGJEY9eyM9VPYhI_XE",
      },
      options: Options(
        method: "GET",
        responseType: ResponseType.plain,
      ),
    );
  }

}