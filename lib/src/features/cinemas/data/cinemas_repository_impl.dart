import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fmovies/src/core/api/cinemas_api_service.dart';
import 'package:fmovies/src/core/utils/network_info.dart';
import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/cinemas/data/model/cinema_response.dart';

import 'cinemas_repository.dart';

class CinemasRepositoryImpl extends CinemasRepository {
  final NetworkInfo networkInfo;
  final CinemasApiService cinemasApiService;

  CinemasRepositoryImpl(
      {@required this.networkInfo, @required this.cinemasApiService});

  @override
  Future<Result<CinemaResponse>> getNearbyCinemas(
      double latitude, double longitude) async {
    bool isConnected = await networkInfo.isConnected();

    if (isConnected) {
      try {
        final response =
            await cinemasApiService.getNearbyCinemas(latitude, longitude);

        var parsed = json.decode(response.data);
        var model = CinemaResponse.fromJson(parsed);

        return Result(success: model);
      } catch (error) {
        return Result(error: ServerError());
      }
    } else {
      return Result(error: NoInternetError());
    }
  }
}
