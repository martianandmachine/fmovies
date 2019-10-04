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

  IntColumn get budget => integer().nullable()();

  TextColumn get homepage => text().nullable()();

  @JsonKey('original_language')
  TextColumn get originalLanguage => text().nullable()();

  RealColumn get popularity => real().nullable()();

  IntColumn get revenue => integer().nullable()();

  IntColumn get runtime => integer().nullable()();

  TextColumn get status => text().nullable()();

  TextColumn get tagline => text().nullable()();

  @JsonKey('vote_average')
  RealColumn get voteAverage => real().nullable()();

  List<Genre> genres;

  @JsonKey('production_countries')
  List<ProductionCountry> productionCountries;
}

class Genre extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}

class ProductionCountry extends Table {
  TextColumn get iso31661 => text()();

  TextColumn get name => text()();
}
