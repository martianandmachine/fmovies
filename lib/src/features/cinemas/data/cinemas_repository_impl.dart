import 'dart:convert';

import 'package:fmovies/src/core/api/cinemas_api_service.dart';
import 'package:fmovies/src/core/utils/network_info.dart';
import 'package:fmovies/src/core/utils/result.dart';

import 'package:fmovies/src/features/cinemas/data/model/cinema_response.dart';
import 'package:get_it/get_it.dart';

import 'cinemas_repository.dart';

class CinemasRepositoryImpl extends CinemasRepository {

  NetworkInfo _networkInfo;
  CinemasApiService _cinemasApiService;

  CinemasRepositoryImpl() {
    _networkInfo = GetIt.instance.get<NetworkInfo>();
    _cinemasApiService = GetIt.instance.get<CinemasApiService>();
  }

  @override
  Future<Result<CinemaResponse>> getNearbyCinemas(double latitude, double longitude) async {
    bool isConnected = await _networkInfo.isConnected();

    if (isConnected) {
      try {
        final response = await _cinemasApiService.getNearbyCinemas(latitude, longitude);

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
