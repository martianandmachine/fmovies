// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credits _$CreditsFromJson(Map<String, dynamic> json) {
  return Credits(
      json['id'] as int,
      (json['cast'] as List)
          ?.map((e) =>
              e == null ? null : Cast.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CreditsToJson(Credits instance) =>
    <String, dynamic>{'id': instance.id, 'cast': instance.cast};
