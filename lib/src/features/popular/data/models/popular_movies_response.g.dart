// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesResponse _$PopularMoviesResponseFromJson(
    Map<String, dynamic> json) {
  return PopularMoviesResponse(
      page: json['page'] as int,
      totalResults: json['totalResults'] as int,
      totalPages: json['totalPages'] as int,
      results: (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PopularMoviesResponseToJson(
        PopularMoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
      'results': instance.results
    };
