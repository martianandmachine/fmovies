import 'package:moor_flutter/moor_flutter.dart';

class Movies extends Table {

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('vote_count')
  IntColumn get voteCount => integer()();

  @JsonKey('poster_path')
  TextColumn get posterPath => text()();

  BoolColumn get adult => boolean()();

  @JsonKey('original_title')
  TextColumn get originalTitle => text()();

  TextColumn get title => text()();

  TextColumn get overview => text()();

  @JsonKey('release_date')
  TextColumn get releaseDate => text()();

  @JsonKey('backdrop_path')
  TextColumn get backdropPath => text()();

  BoolColumn get isFavorite => boolean().withDefault(Constant(false))();
}
