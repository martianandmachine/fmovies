// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class MoorMovie extends DataClass implements Insertable<MoorMovie> {
  final int id;
  final String title;
  MoorMovie({@required this.id, @required this.title});
  factory MoorMovie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return MoorMovie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
    );
  }
  factory MoorMovie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return MoorMovie(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<MoorMovie>>(bool nullToAbsent) {
    return MoorMoviesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
    ) as T;
  }

  MoorMovie copyWith({int id, String title}) => MoorMovie(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('MoorMovie(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, title.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is MoorMovie && other.id == id && other.title == title);
}

class MoorMoviesCompanion extends UpdateCompanion<MoorMovie> {
  final Value<int> id;
  final Value<String> title;
  const MoorMoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  MoorMoviesCompanion copyWith({Value<int> id, Value<String> title}) {
    return MoorMoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}

class $MoorMoviesTable extends MoorMovies
    with TableInfo<$MoorMoviesTable, MoorMovie> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoorMoviesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
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

  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  $MoorMoviesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'moor_movies';
  @override
  final String actualTableName = 'moor_movies';
  @override
  VerificationContext validateIntegrity(MoorMoviesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoorMovie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MoorMovie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MoorMoviesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    return map;
  }

  @override
  $MoorMoviesTable createAlias(String alias) {
    return $MoorMoviesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $MoorMoviesTable _moorMovies;
  $MoorMoviesTable get moorMovies => _moorMovies ??= $MoorMoviesTable(this);
  MoorMoviesDao _moorMoviesDao;
  MoorMoviesDao get moorMoviesDao =>
      _moorMoviesDao ??= MoorMoviesDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [moorMovies];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$MoorMoviesDaoMixin on DatabaseAccessor<AppDatabase> {
  $MoorMoviesTable get moorMovies => db.moorMovies;
}
