// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesResponse _$PopularMoviesResponseFromJson(
    Map<String, dynamic> json) {
  return PopularMoviesResponse(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PopularMoviesResponseToJson(
        PopularMoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results
    };
