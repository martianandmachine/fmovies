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
  final int budget;
  final String homepage;
  final String originalLanguage;
  final double popularity;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final double voteAverage;

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
      @required this.isFavorite,
      this.budget,
      this.homepage,
      this.originalLanguage,
      this.popularity,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.voteAverage});

  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final doubleType = db.typeSystem.forDartType<double>();
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
      budget: intType.mapFromDatabaseResponse(data['${effectivePrefix}budget']),
      homepage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}homepage']),
      originalLanguage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}original_language']),
      popularity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity']),
      revenue:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}revenue']),
      runtime:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}runtime']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      tagline:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tagline']),
      voteAverage: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average']),
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
      budget: serializer.fromJson<int>(json['budget']),
      homepage: serializer.fromJson<String>(json['homepage']),
      originalLanguage: serializer.fromJson<String>(json['original_language']),
      popularity: serializer.fromJson<double>(json['popularity']),
      revenue: serializer.fromJson<int>(json['revenue']),
      runtime: serializer.fromJson<int>(json['runtime']),
      status: serializer.fromJson<String>(json['status']),
      tagline: serializer.fromJson<String>(json['tagline']),
      voteAverage: serializer.fromJson<double>(json['vote_average'].toDouble()),
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
      'budget': serializer.toJson<int>(budget),
      'homepage': serializer.toJson<String>(homepage),
      'original_language': serializer.toJson<String>(originalLanguage),
      'popularity': serializer.toJson<double>(popularity),
      'revenue': serializer.toJson<int>(revenue),
      'runtime': serializer.toJson<int>(runtime),
      'status': serializer.toJson<String>(status),
      'tagline': serializer.toJson<String>(tagline),
      'vote_average': serializer.toJson<double>(voteAverage),
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
      budget:
          budget == null && nullToAbsent ? const Value.absent() : Value(budget),
      homepage: homepage == null && nullToAbsent
          ? const Value.absent()
          : Value(homepage),
      originalLanguage: originalLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originalLanguage),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      revenue: revenue == null && nullToAbsent
          ? const Value.absent()
          : Value(revenue),
      runtime: runtime == null && nullToAbsent
          ? const Value.absent()
          : Value(runtime),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      tagline: tagline == null && nullToAbsent
          ? const Value.absent()
          : Value(tagline),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
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
          bool isFavorite,
          int budget,
          String homepage,
          String originalLanguage,
          double popularity,
          int revenue,
          int runtime,
          String status,
          String tagline,
          double voteAverage}) =>
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
        budget: budget ?? this.budget,
        homepage: homepage ?? this.homepage,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        popularity: popularity ?? this.popularity,
        revenue: revenue ?? this.revenue,
        runtime: runtime ?? this.runtime,
        status: status ?? this.status,
        tagline: tagline ?? this.tagline,
        voteAverage: voteAverage ?? this.voteAverage,
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
          ..write('isFavorite: $isFavorite, ')
          ..write('budget: $budget, ')
          ..write('homepage: $homepage, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('popularity: $popularity, ')
          ..write('revenue: $revenue, ')
          ..write('runtime: $runtime, ')
          ..write('status: $status, ')
          ..write('tagline: $tagline, ')
          ..write('voteAverage: $voteAverage')
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
                                  $mrjc(
                                      backdropPath.hashCode,
                                      $mrjc(
                                          isFavorite.hashCode,
                                          $mrjc(
                                              budget.hashCode,
                                              $mrjc(
                                                  homepage.hashCode,
                                                  $mrjc(
                                                      originalLanguage.hashCode,
                                                      $mrjc(
                                                          popularity.hashCode,
                                                          $mrjc(
                                                              revenue.hashCode,
                                                              $mrjc(
                                                                  runtime
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      status
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          tagline
                                                                              .hashCode,
                                                                          voteAverage
                                                                              .hashCode)))))))))))))))))));

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
          other.isFavorite == isFavorite &&
          other.budget == budget &&
          other.homepage == homepage &&
          other.originalLanguage == originalLanguage &&
          other.popularity == popularity &&
          other.revenue == revenue &&
          other.runtime == runtime &&
          other.status == status &&
          other.tagline == tagline &&
          other.voteAverage == voteAverage);
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
  final Value<int> budget;
  final Value<String> homepage;
  final Value<String> originalLanguage;
  final Value<double> popularity;
  final Value<int> revenue;
  final Value<int> runtime;
  final Value<String> status;
  final Value<String> tagline;
  final Value<double> voteAverage;

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
    this.budget = const Value.absent(),
    this.homepage = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.popularity = const Value.absent(),
    this.revenue = const Value.absent(),
    this.runtime = const Value.absent(),
    this.status = const Value.absent(),
    this.tagline = const Value.absent(),
    this.voteAverage = const Value.absent(),
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
      Value<bool> isFavorite,
      Value<int> budget,
      Value<String> homepage,
      Value<String> originalLanguage,
      Value<double> popularity,
      Value<int> revenue,
      Value<int> runtime,
      Value<String> status,
      Value<String> tagline,
      Value<double> voteAverage}) {
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
      budget: budget ?? this.budget,
      homepage: homepage ?? this.homepage,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      popularity: popularity ?? this.popularity,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      voteAverage: voteAverage ?? this.voteAverage,
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

  final VerificationMeta _budgetMeta = const VerificationMeta('budget');
  GeneratedIntColumn _budget;

  @override
  GeneratedIntColumn get budget => _budget ??= _constructBudget();

  GeneratedIntColumn _constructBudget() {
    return GeneratedIntColumn(
      'budget',
      $tableName,
      true,
    );
  }

  final VerificationMeta _homepageMeta = const VerificationMeta('homepage');
  GeneratedTextColumn _homepage;

  @override
  GeneratedTextColumn get homepage => _homepage ??= _constructHomepage();

  GeneratedTextColumn _constructHomepage() {
    return GeneratedTextColumn(
      'homepage',
      $tableName,
      true,
    );
  }

  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  GeneratedTextColumn _originalLanguage;

  @override
  GeneratedTextColumn get originalLanguage =>
      _originalLanguage ??= _constructOriginalLanguage();

  GeneratedTextColumn _constructOriginalLanguage() {
    return GeneratedTextColumn(
      'original_language',
      $tableName,
      true,
    );
  }

  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  GeneratedRealColumn _popularity;

  @override
  GeneratedRealColumn get popularity => _popularity ??= _constructPopularity();

  GeneratedRealColumn _constructPopularity() {
    return GeneratedRealColumn(
      'popularity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _revenueMeta = const VerificationMeta('revenue');
  GeneratedIntColumn _revenue;

  @override
  GeneratedIntColumn get revenue => _revenue ??= _constructRevenue();

  GeneratedIntColumn _constructRevenue() {
    return GeneratedIntColumn(
      'revenue',
      $tableName,
      true,
    );
  }

  final VerificationMeta _runtimeMeta = const VerificationMeta('runtime');
  GeneratedIntColumn _runtime;

  @override
  GeneratedIntColumn get runtime => _runtime ??= _constructRuntime();

  GeneratedIntColumn _constructRuntime() {
    return GeneratedIntColumn(
      'runtime',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;

  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();

  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _taglineMeta = const VerificationMeta('tagline');
  GeneratedTextColumn _tagline;

  @override
  GeneratedTextColumn get tagline => _tagline ??= _constructTagline();

  GeneratedTextColumn _constructTagline() {
    return GeneratedTextColumn(
      'tagline',
      $tableName,
      true,
    );
  }

  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  GeneratedRealColumn _voteAverage;

  @override
  GeneratedRealColumn get voteAverage =>
      _voteAverage ??= _constructVoteAverage();

  GeneratedRealColumn _constructVoteAverage() {
    return GeneratedRealColumn(
      'vote_average',
      $tableName,
      true,
    );
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
        isFavorite,
        budget,
        homepage,
        originalLanguage,
        popularity,
        revenue,
        runtime,
        status,
        tagline,
        voteAverage
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
    if (d.budget.present) {
      context.handle(
          _budgetMeta, budget.isAcceptableValue(d.budget.value, _budgetMeta));
    } else if (budget.isRequired && isInserting) {
      context.missing(_budgetMeta);
    }
    if (d.homepage.present) {
      context.handle(_homepageMeta,
          homepage.isAcceptableValue(d.homepage.value, _homepageMeta));
    } else if (homepage.isRequired && isInserting) {
      context.missing(_homepageMeta);
    }
    if (d.originalLanguage.present) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableValue(
              d.originalLanguage.value, _originalLanguageMeta));
    } else if (originalLanguage.isRequired && isInserting) {
      context.missing(_originalLanguageMeta);
    }
    if (d.popularity.present) {
      context.handle(_popularityMeta,
          popularity.isAcceptableValue(d.popularity.value, _popularityMeta));
    } else if (popularity.isRequired && isInserting) {
      context.missing(_popularityMeta);
    }
    if (d.revenue.present) {
      context.handle(_revenueMeta,
          revenue.isAcceptableValue(d.revenue.value, _revenueMeta));
    } else if (revenue.isRequired && isInserting) {
      context.missing(_revenueMeta);
    }
    if (d.runtime.present) {
      context.handle(_runtimeMeta,
          runtime.isAcceptableValue(d.runtime.value, _runtimeMeta));
    } else if (runtime.isRequired && isInserting) {
      context.missing(_runtimeMeta);
    }
    if (d.status.present) {
      context.handle(
          _statusMeta, status.isAcceptableValue(d.status.value, _statusMeta));
    } else if (status.isRequired && isInserting) {
      context.missing(_statusMeta);
    }
    if (d.tagline.present) {
      context.handle(_taglineMeta,
          tagline.isAcceptableValue(d.tagline.value, _taglineMeta));
    } else if (tagline.isRequired && isInserting) {
      context.missing(_taglineMeta);
    }
    if (d.voteAverage.present) {
      context.handle(_voteAverageMeta,
          voteAverage.isAcceptableValue(d.voteAverage.value, _voteAverageMeta));
    } else if (voteAverage.isRequired && isInserting) {
      context.missing(_voteAverageMeta);
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
    if (d.budget.present) {
      map['budget'] = Variable<int, IntType>(d.budget.value);
    }
    if (d.homepage.present) {
      map['homepage'] = Variable<String, StringType>(d.homepage.value);
    }
    if (d.originalLanguage.present) {
      map['original_language'] =
          Variable<String, StringType>(d.originalLanguage.value);
    }
    if (d.popularity.present) {
      map['popularity'] = Variable<double, RealType>(d.popularity.value);
    }
    if (d.revenue.present) {
      map['revenue'] = Variable<int, IntType>(d.revenue.value);
    }
    if (d.runtime.present) {
      map['runtime'] = Variable<int, IntType>(d.runtime.value);
    }
    if (d.status.present) {
      map['status'] = Variable<String, StringType>(d.status.value);
    }
    if (d.tagline.present) {
      map['tagline'] = Variable<String, StringType>(d.tagline.value);
    }
    if (d.voteAverage.present) {
      map['vote_average'] = Variable<double, RealType>(d.voteAverage.value);
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
