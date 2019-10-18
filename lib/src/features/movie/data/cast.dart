import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  String character;
  String name;
  @JsonKey(name: 'profile_path')
  String profilePath;

  Cast(this.character, this.name, this.profilePath);

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
