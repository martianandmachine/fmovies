import 'package:fmovies/src/core/utils/result.dart';
import 'package:fmovies/src/features/cinemas/data/model/cinema_response.dart';

abstract class CinemasRepository {
  Future<Result<CinemaResponse>> getNearbyCinemas(
      double latitude, double longitude);
}
