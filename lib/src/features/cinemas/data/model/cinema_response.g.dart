// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaResponse _$CinemaResponseFromJson(Map<String, dynamic> json) {
  return CinemaResponse((json['results'] as List)
      ?.map(
          (e) => e == null ? null : Cinema.fromJson(e as Map<String, dynamic>))
      ?.toList())
    ..errorMessage = json['error_message'] as String;
}

Map<String, dynamic> _$CinemaResponseToJson(CinemaResponse instance) =>
    <String, dynamic>{
      'error_message': instance.errorMessage,
      'results': instance.results
    };
