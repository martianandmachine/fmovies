import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  double popularity;
  int voteCount;
  bool video;
  @JsonKey(name: 'poster_path')
  String posterPath;
  int id;
  bool adult;
  @JsonKey(name: 'orginal_title')
  String originalTitle;
  String title;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;

  Movie(
      {this.popularity,
      this.voteCount,
      this.video,
      this.posterPath,
      this.id,
      this.adult,
      this.originalTitle,
      this.title,
      this.voteAverage,
      this.overview,
      this.releaseDate,
      this.backdropPath});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
