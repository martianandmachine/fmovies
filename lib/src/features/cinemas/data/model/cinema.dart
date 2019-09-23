import 'package:json_annotation/json_annotation.dart';
part 'cinema.g.dart';

@JsonSerializable()
class Cinema {
  Geometry geometry;
  String icon;
  String id;
  String name;
  String placeId;
  double rating;
  String reference;
  int userRatingsTotal;
  String vicinity;

  Cinema(this.icon, this.id, this.name, this.placeId, this.rating,
      this.reference, this.userRatingsTotal, this.vicinity);

  factory Cinema.fromJson(Map<String, dynamic> json) => _$CinemaFromJson(json);
  Map<String, dynamic> toJson() => _$CinemaToJson(this);
}

@JsonSerializable()
class Geometry {
  Location location;

  Geometry(this.location);

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Location {
  double lat;
  double lng;

  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
