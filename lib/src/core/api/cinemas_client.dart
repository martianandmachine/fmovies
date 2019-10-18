import 'package:dio/dio.dart';

class CinemasClient {
  Dio build() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://maps.googleapis.com",
      queryParameters: {
        "key": "AIzaSyCmRJiynYcCjxYRgbGJEY9eyM9VPYhI_XE",
      },
    );
    return Dio(baseOptions);
  }
}
