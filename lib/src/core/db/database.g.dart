// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Movie extends DataClass implements Insertable<Movie> {
  final int id;
  final int voteCount;
  final String posterPath;
  final bool adult;
  final String originalTitle;
  final String title;
  final String overview;
  final String releaseDate;
  final String backdropPath;
  bool isFavorite;
  Movie(
      {@required this.id,
      @required this.voteCount,
      @required this.posterPath,
      @required this.adult,
      @required this.originalTitle,
      @required this.title,
      @required this.overview,
      @required this.releaseDate,
      @required this.backdropPath,
      @required this.isFavorite});
  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Movie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      voteCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
      posterPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path']),
      adult: boolType.mapFromDatabaseResponse(data['${effectivePrefix}adult']),
      originalTitle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}original_title']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      overview: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      releaseDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
      backdropPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      isFavorite: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favorite']),
    );
  }
  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      voteCount: serializer.fromJson<int>(json['vote_count']),
      posterPath: serializer.fromJson<String>(json['poster_path']),
      adult: serializer.fromJson<bool>(json['adult']),
      originalTitle: serializer.fromJson<String>(json['original_title']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['release_date']),
      backdropPath: serializer.fromJson<String>(json['backdrop_path']),
      isFavorite: false,
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'vote_count': serializer.toJson<int>(voteCount),
      'poster_path': serializer.toJson<String>(posterPath),
      'adult': serializer.toJson<bool>(adult),
      'original_title': serializer.toJson<String>(originalTitle),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'release_date': serializer.toJson<String>(releaseDate),
      'backdrop_path': serializer.toJson<String>(backdropPath),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Movie>>(bool nullToAbsent) {
    return MoviesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      adult:
          adult == null && nullToAbsent ? const Value.absent() : Value(adult),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      isFavorite: isFavorite == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavorite),
    ) as T;
  }

  Movie copyWith(
          {int id,
          int voteCount,
          String posterPath,
          bool adult,
          String originalTitle,
          String title,
          String overview,
          String releaseDate,
          String backdropPath,
          bool isFavorite}) =>
      Movie(
        id: id ?? this.id,
        voteCount: voteCount ?? this.voteCount,
        posterPath: posterPath ?? this.posterPath,
        adult: adult ?? this.adult,
        originalTitle: originalTitle ?? this.originalTitle,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        backdropPath: backdropPath ?? this.backdropPath,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('voteCount: $voteCount, ')
          ..write('posterPath: $posterPath, ')
          ..write('adult: $adult, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          voteCount.hashCode,
          $mrjc(
              posterPath.hashCode,
              $mrjc(
                  adult.hashCode,
                  $mrjc(
                      originalTitle.hashCode,
                      $mrjc(
                          title.hashCode,
                          $mrjc(
                              overview.hashCode,
                              $mrjc(
                                  releaseDate.hashCode,
                                  $mrjc(backdropPath.hashCode,
                                      isFavorite.hashCode))))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == id &&
          other.voteCount == voteCount &&
          other.posterPath == posterPath &&
          other.adult == adult &&
          other.originalTitle == originalTitle &&
          other.title == title &&
          other.overview == overview &&
          other.releaseDate == releaseDate &&
          other.backdropPath == backdropPath &&
          other.isFavorite == isFavorite);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<int> voteCount;
  final Value<String> posterPath;
  final Value<bool> adult;
  final Value<String> originalTitle;
  final Value<String> title;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<String> backdropPath;
  final Value<bool> isFavorite;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.adult = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  MoviesCompanion copyWith(
      {Value<int> id,
      Value<int> voteCount,
      Value<String> posterPath,
      Value<bool> adult,
      Value<String> originalTitle,
      Value<String> title,
      Value<String> overview,
      Value<String> releaseDate,
      Value<String> backdropPath,
      Value<bool> isFavorite}) {
    return MoviesCompanion(
      id: id ?? this.id,
      voteCount: voteCount ?? this.voteCount,
      posterPath: posterPath ?? this.posterPath,
      adult: adult ?? this.adult,
      originalTitle: originalTitle ?? this.originalTitle,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      backdropPath: backdropPath ?? this.backdropPath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  GeneratedIntColumn _voteCount;
  @override
  GeneratedIntColumn get voteCount => _voteCount ??= _constructVoteCount();
  GeneratedIntColumn _constructVoteCount() {
    return GeneratedIntColumn(
      'vote_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  GeneratedTextColumn _posterPath;
  @override
  GeneratedTextColumn get posterPath => _posterPath ??= _constructPosterPath();
  GeneratedTextColumn _constructPosterPath() {
    return GeneratedTextColumn(
      'poster_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  GeneratedBoolColumn _adult;
  @override
  GeneratedBoolColumn get adult => _adult ??= _constructAdult();
  GeneratedBoolColumn _constructAdult() {
    return GeneratedBoolColumn(
      'adult',
      $tableName,
      false,
    );
  }

  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  GeneratedTextColumn _originalTitle;
  @override
  GeneratedTextColumn get originalTitle =>
      _originalTitle ??= _constructOriginalTitle();
  GeneratedTextColumn _constructOriginalTitle() {
    return GeneratedTextColumn(
      'original_title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  GeneratedTextColumn _overview;
  @override
  GeneratedTextColumn get overview => _overview ??= _constructOverview();
  GeneratedTextColumn _constructOverview() {
    return GeneratedTextColumn(
      'overview',
      $tableName,
      false,
    );
  }

  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  GeneratedTextColumn _releaseDate;
  @override
  GeneratedTextColumn get releaseDate =>
      _releaseDate ??= _constructReleaseDate();
  GeneratedTextColumn _constructReleaseDate() {
    return GeneratedTextColumn(
      'release_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  GeneratedTextColumn _backdropPath;
  @override
  GeneratedTextColumn get backdropPath =>
      _backdropPath ??= _constructBackdropPath();
  GeneratedTextColumn _constructBackdropPath() {
    return GeneratedTextColumn(
      'backdrop_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isFavoriteMeta = const VerificationMeta('isFavorite');
  GeneratedBoolColumn _isFavorite;
  @override
  GeneratedBoolColumn get isFavorite => _isFavorite ??= _constructIsFavorite();
  GeneratedBoolColumn _constructIsFavorite() {
    return GeneratedBoolColumn('is_favorite', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        voteCount,
        posterPath,
        adult,
        originalTitle,
        title,
        overview,
        releaseDate,
        backdropPath,
        isFavorite
      ];
  @override
  $MoviesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'movies';
  @override
  final String actualTableName = 'movies';
  @override
  VerificationContext validateIntegrity(MoviesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.voteCount.present) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableValue(d.voteCount.value, _voteCountMeta));
    } else if (voteCount.isRequired && isInserting) {
      context.missing(_voteCountMeta);
    }
    if (d.posterPath.present) {
      context.handle(_posterPathMeta,
          posterPath.isAcceptableValue(d.posterPath.value, _posterPathMeta));
    } else if (posterPath.isRequired && isInserting) {
      context.missing(_posterPathMeta);
    }
    if (d.adult.present) {
      context.handle(
          _adultMeta, adult.isAcceptableValue(d.adult.value, _adultMeta));
    } else if (adult.isRequired && isInserting) {
      context.missing(_adultMeta);
    }
    if (d.originalTitle.present) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableValue(
              d.originalTitle.value, _originalTitleMeta));
    } else if (originalTitle.isRequired && isInserting) {
      context.missing(_originalTitleMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.overview.present) {
      context.handle(_overviewMeta,
          overview.isAcceptableValue(d.overview.value, _overviewMeta));
    } else if (overview.isRequired && isInserting) {
      context.missing(_overviewMeta);
    }
    if (d.releaseDate.present) {
      context.handle(_releaseDateMeta,
          releaseDate.isAcceptableValue(d.releaseDate.value, _releaseDateMeta));
    } else if (releaseDate.isRequired && isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (d.backdropPath.present) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableValue(
              d.backdropPath.value, _backdropPathMeta));
    } else if (backdropPath.isRequired && isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (d.isFavorite.present) {
      context.handle(_isFavoriteMeta,
          isFavorite.isAcceptableValue(d.isFavorite.value, _isFavoriteMeta));
    } else if (isFavorite.isRequired && isInserting) {
      context.missing(_isFavoriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Movie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MoviesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.voteCount.present) {
      map['vote_count'] = Variable<int, IntType>(d.voteCount.value);
    }
    if (d.posterPath.present) {
      map['poster_path'] = Variable<String, StringType>(d.posterPath.value);
    }
    if (d.adult.present) {
      map['adult'] = Variable<bool, BoolType>(d.adult.value);
    }
    if (d.originalTitle.present) {
      map['original_title'] =
          Variable<String, StringType>(d.originalTitle.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.overview.present) {
      map['overview'] = Variable<String, StringType>(d.overview.value);
    }
    if (d.releaseDate.present) {
      map['release_date'] = Variable<String, StringType>(d.releaseDate.value);
    }
    if (d.backdropPath.present) {
      map['backdrop_path'] = Variable<String, StringType>(d.backdropPath.value);
    }
    if (d.isFavorite.present) {
      map['is_favorite'] = Variable<bool, BoolType>(d.isFavorite.value);
    }
    return map;
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $MoviesTable _movies;
  $MoviesTable get movies => _movies ??= $MoviesTable(this);
  MoviesDao _moviesDao;
  MoviesDao get moviesDao => _moviesDao ??= MoviesDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [movies];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$MoviesDaoMixin on DatabaseAccessor<AppDatabase> {
  $MoviesTable get movies => db.movies;
}
