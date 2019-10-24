import 'package:fmovies/src/features/movie/data/cast.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credits.g.dart';

@JsonSerializable()
class Credits {
  int id;
  List<Cast> cast;

  Credits(this.id, this.cast);

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}
