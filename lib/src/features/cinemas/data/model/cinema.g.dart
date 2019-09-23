// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cinema _$CinemaFromJson(Map<String, dynamic> json) {
  return Cinema(
      json['icon'] as String,
      json['id'] as String,
      json['name'] as String,
      json['placeId'] as String,
      (json['rating'] as num)?.toDouble(),
      json['reference'] as String,
      json['userRatingsTotal'] as int,
      json['vicinity'] as String)
    ..geometry = json['geometry'] == null
        ? null
        : Geometry.fromJson(json['geometry'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CinemaToJson(Cinema instance) => <String, dynamic>{
      'geometry': instance.geometry,
      'icon': instance.icon,
      'id': instance.id,
      'name': instance.name,
      'placeId': instance.placeId,
      'rating': instance.rating,
      'reference': instance.reference,
      'userRatingsTotal': instance.userRatingsTotal,
      'vicinity': instance.vicinity
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return Geometry(json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GeometryToJson(Geometry instance) =>
    <String, dynamic>{'location': instance.location};

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      lat: (json['lat'] as num)?.toDouble(),
      lng: (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$LocationToJson(Location instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};
