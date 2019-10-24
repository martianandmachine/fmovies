import 'package:dio/dio.dart';

abstract class CinemasApiService {
  Future<Response> getNearbyCinemas(double latitude, double longitude);
}
