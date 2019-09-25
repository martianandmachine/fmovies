// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      popularity: (json['popularity'] as num)?.toDouble(),
      voteCount: json['voteCount'] as int,
      posterPath: json['poster_path'] as String,
      id: json['id'] as int,
      adult: json['adult'] as bool,
      originalTitle: json['orginal_title'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num)?.toDouble(),
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      backdropPath: json['backdrop_path'] as String);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'popularity': instance.popularity,
      'voteCount': instance.voteCount,
      'poster_path': instance.posterPath,
      'id': instance.id,
      'adult': instance.adult,
      'orginal_title': instance.originalTitle,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'backdrop_path': instance.backdropPath
    };
