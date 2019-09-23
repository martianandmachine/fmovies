// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CinemaResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaResponse _$CinemaResponseFromJson(Map<String, dynamic> json) {
  return CinemaResponse((json['results'] as List)
      ?.map(
          (e) => e == null ? null : Cinema.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$CinemaResponseToJson(CinemaResponse instance) =>
    <String, dynamic>{'results': instance.results};
