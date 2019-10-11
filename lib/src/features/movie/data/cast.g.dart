// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) {
  return Cast(json['character'] as String, json['name'] as String,
      json['profile_path'] as String);
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'character': instance.character,
      'name': instance.name,
      'profile_path': instance.profilePath
    };
