// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      popularity: (json['popularity'] as num)?.toDouble(),
      voteCount: json['voteCount'] as int,
      video: json['video'] as bool,
      posterPath: json['posterPath'] as String,
      id: json['id'] as int,
      adult: json['adult'] as bool,
      originalTitle: json['originalTitle'] as String,
      title: json['title'] as String,
      voteAverage: (json['voteAverage'] as num)?.toDouble(),
      overview: json['overview'] as String,
      releaseDate: json['releaseDate'] as String);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'popularity': instance.popularity,
      'voteCount': instance.voteCount,
      'video': instance.video,
      'posterPath': instance.posterPath,
      'id': instance.id,
      'adult': instance.adult,
      'originalTitle': instance.originalTitle,
      'title': instance.title,
      'voteAverage': instance.voteAverage,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate
    };
