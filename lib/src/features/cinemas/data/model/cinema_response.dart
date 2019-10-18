import 'package:fmovies/src/features/cinemas/data/model/cinema.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cinema_response.g.dart';

@JsonSerializable()
class CinemaResponse {
  @JsonKey(name: 'error_message')
  String errorMessage;
  List<Cinema> results;

  CinemaResponse(this.results);

  factory CinemaResponse.fromJson(Map<String, dynamic> json) =>
      _$CinemaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaResponseToJson(this);
}
