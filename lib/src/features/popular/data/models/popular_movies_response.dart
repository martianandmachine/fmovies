import 'package:fmovies/src/core/db/moor_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movies_response.g.dart';

@JsonSerializable()
class PopularMoviesResponse {
  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;
  List<Movie> results;

  PopularMoviesResponse(
      {this.page, this.totalResults, this.totalPages, this.results});

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) => _$PopularMoviesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PopularMoviesResponseToJson(this);
}