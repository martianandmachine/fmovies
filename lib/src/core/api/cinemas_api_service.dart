import 'package:dio/dio.dart';

abstract class CinemasApiService {
  Dio buildClient();

  Future<Response> getNearbyCinemas(double latitude, double longitude);
}
